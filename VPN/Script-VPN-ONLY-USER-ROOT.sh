#!/bin/bash

# Actualizacion e instalacion
apt update
apt install easy-rsa ssh openvpn

# Crarcion de carpeta y enlace simbolico

mkdir ~/easy-rsa
ln -s /usr/share/easy-rsa/* ~/easy-rsa/

cd ~/easy-rsa

# Creacion VARS

cat << EOF > ~/easy-rsa/vars
set_var EASYRSA_REQ_COUNTRY    "ES"
set_var EASYRSA_REQ_PROVINCE   "BCN"
set_var EASYRSA_REQ_CITY       "Cornella"
set_var EASYRSA_REQ_ORG        "OpenVPN-IETI"
set_var EASYRSA_REQ_EMAIL      "truenasieti@gmail.com"
set_var EASYRSA_REQ_OU         "OpenVPN"
set_var EASYRSA_ALGO           "ec"
set_var EASYRSA_DIGEST         "sha512"
EOF

# Creacion certificados con VARS

/root/easy-rsa/./easyrsa init-pki

/root/easy-rsa/./easyrsa build-ca nopass
cp ~/easy-rsa/pki/ca.crt /usr/local/share/ca-certificates/

update-ca-certificates

# Creamos el req y la key para el servidor

/root/easy-rsa/./easyrsa gen-req server nopass
/root/easy-rsa/./easyrsa sign-req server server
cp ~/easy-rsa/pki/private/server.key /etc/openvpn/server/
cp ~/easy-rsa/pki/issued/server.crt /etc/openvpn/server/
cp ~/easy-rsa/pki/ca.crt /etc/openvpn/server/

# Creamos la ta.key y la movemos

openvpn --genkey --secret /root/easy-rsa/ta.key

mkdir -p ~/client-confs/keys
cp /root/easy-rsa/ta.key /etc/openvpn/server/
cp /etc/openvpn/server/ca.crt ~/client-confs/keys/

# Creamos los certificados de los usuarios

/root/easy-rsa/./easyrsa gen-req santi nopass
/root/easy-rsa/./easyrsa gen-req joan nopass
/root/easy-rsa/./easyrsa gen-req alex nopass
cp ~/easy-rsa/pki/private/alex.key ~/client-confs/keys/
cp ~/easy-rsa/pki/private/joan.key ~/client-confs/keys/
cp ~/easy-rsa/pki/private/santi.key ~/client-confs/keys/

# Firmamos los certificados de los usuarios

/root/easy-rsa/./easyrsa sign-req client joan
/root/easy-rsa/./easyrsa sign-req client santi
/root/easy-rsa/./easyrsa sign-req client alex
cp ~/easy-rsa/pki/issued/alex.crt ~/client-confs/keys/
cp ~/easy-rsa/pki/issued/joan.crt ~/client-confs/keys/
cp ~/easy-rsa/pki/issued/santi.crt ~/client-confs/keys/

# Copiamos la configuracion por defecto

cp /usr/share/doc/openvpn/examples/sample-config-files/server.conf.gz /etc/openvpn/server/

# La extraemos y la editamos

gunzip /etc/openvpn/server/server.conf.gz
mv /etc/openvpn/server/server.conf /etc/openvpn/server/server.conf.copy

cat << EOF > /etc/openvpn/server/server.conf
;local a.b.c.d
port 1194
;proto tcp
proto udp
;dev tap
dev tun
;dev-node MyTap
ca ca.crt
cert server.crt
key server.key  # This file should be kept secret
;dh dh2048.pem
dh none
;topology subnet
server 10.8.0.0 255.255.255.0
ifconfig-pool-persist /var/log/openvpn/ipp.txt
;server-bridge 10.8.0.4 255.255.255.0 10.8.0.50 10.8.0.100
;server-bridge
push "route 192.168.1.0 255.255.255.0"
;push "route 192.168.20.0 255.255.255.0"
;client-config-dir ccd
;route 192.168.40.128 255.255.255.248
;client-config-dir ccd
;route 10.9.0.0 255.255.255.252
;learn-address ./script
;push "redirect-gateway def1 bypass-dhcp"
;push "dhcp-option DNS 208.67.222.222"
;client-to-client
;duplicate-cn
keepalive 10 120
;tls-auth ta.key 0 # This file is secret
tls-crypt ta.key
;cipher AES-256-CBC
cipher AES-256-GCM
auth SHA256
;compress lz4-v2
;push "compress lz4-v2"
;comp-lzo
max-clients 50
user nobody
group nogroup
persist-key
persist-tun
status /var/log/openvpn/openvpn-status.log
;log         /var/log/openvpn/openvpn.log
;log-append  /var/log/openvpn/openvpn.log
verb 3
;mute 20
explicit-exit-notify 1
EOF

# Realizamos todas las configuraciones para habilitar el forward

mv /etc/sysctl.conf /etc/sysctl.conf.copy

cat << EOF > /etc/sysctl.conf
#
# /etc/sysctl.conf - Configuration file for setting system variables
# See /etc/sysctl.d/ for additional system variables.
# See sysctl.conf (5) for information.
#

#kernel.domainname = example.com

# Uncomment the following to stop low-level messages on console
#kernel.printk = 3 4 1 3

##############################################################3
# Functions previously found in netbase
#

# Uncomment the next two lines to enable Spoof protection (reverse-path filter)
# Turn on Source Address Verification in all interfaces to
# prevent some spoofing attacks
#net.ipv4.conf.default.rp_filter=1
#net.ipv4.conf.all.rp_filter=1

# Uncomment the next line to enable TCP/IP SYN cookies
# See http://lwn.net/Articles/277146/
# Note: This may impact IPv6 TCP sessions too
#net.ipv4.tcp_syncookies=1

# Uncomment the next line to enable packet forwarding for IPv4
net.ipv4.ip_forward=1

# Uncomment the next line to enable packet forwarding for IPv6
#  Enabling this option disables Stateless Address Autoconfiguration
#  based on Router Advertisements for this host
#net.ipv6.conf.all.forwarding=1


###################################################################
# Additional settings - these settings can improve the network
# security of the host and prevent against some network attacks
# including spoofing attacks and man in the middle attacks through
# redirection. Some network environments, however, require that these
# settings are disabled so review and enable them as needed.
#
# Do not accept ICMP redirects (prevent MITM attacks)
#net.ipv4.conf.all.accept_redirects = 0
#net.ipv6.conf.all.accept_redirects = 0
# _or_
# Accept ICMP redirects only for gateways listed in our default
# gateway list (enabled by default)
# net.ipv4.conf.all.secure_redirects = 1
#
# Do not send ICMP redirects (we are not a router)
#net.ipv4.conf.all.send_redirects = 0
#
# Do not accept IP source route packets (we are not a router)
#net.ipv4.conf.all.accept_source_route = 0
#net.ipv6.conf.all.accept_source_route = 0
#
# Log Martian Packets
#net.ipv4.conf.all.log_martians = 1
#

###################################################################
# Magic system request Key
# 0=disable, 1=enable all, >1 bitmask of sysrq functions
# See https://www.kernel.org/doc/html/latest/admin-guide/sysrq.html
# for what other values do
#kernel.sysrq=438
EOF

# Cargamos la configuracion

sysctl -p

# Realizamos todas las configuraciónes para habilitar el forward y el puerto en UFW

mv /etc/ufw/before.rules /etc/ufw/before.rules.copy

cat << EOF > /etc/ufw/before.rules
# rules.before
#
# Rules that should be run before the ufw command line added rules. Custom
# rules should be added to one of these chains:
#   ufw-before-input
#   ufw-before-output
#   ufw-before-forward
#

# Don't delete these required lines, otherwise there will be errors
*filter
:ufw-before-input - [0:0]
:ufw-before-output - [0:0]
:ufw-before-forward - [0:0]
:ufw-not-local - [0:0]
# End required lines


# allow all on loopback
-A ufw-before-input -i lo -j ACCEPT
-A ufw-before-output -o lo -j ACCEPT

# quickly process packets for which we already have a connection
-A ufw-before-input -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
-A ufw-before-output -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
-A ufw-before-forward -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT

# drop INVALID packets (logs these in loglevel medium and higher)
-A ufw-before-input -m conntrack --ctstate INVALID -j ufw-logging-deny
-A ufw-before-input -m conntrack --ctstate INVALID -j DROP

# ok icmp codes for INPUT
-A ufw-before-input -p icmp --icmp-type destination-unreachable -j ACCEPT
-A ufw-before-input -p icmp --icmp-type time-exceeded -j ACCEPT
-A ufw-before-input -p icmp --icmp-type parameter-problem -j ACCEPT
-A ufw-before-input -p icmp --icmp-type echo-request -j ACCEPT

# ok icmp code for FORWARD
-A ufw-before-forward -p icmp --icmp-type destination-unreachable -j ACCEPT
-A ufw-before-forward -p icmp --icmp-type time-exceeded -j ACCEPT
-A ufw-before-forward -p icmp --icmp-type parameter-problem -j ACCEPT
-A ufw-before-forward -p icmp --icmp-type echo-request -j ACCEPT

# allow dhcp client to work
-A ufw-before-input -p udp --sport 67 --dport 68 -j ACCEPT

#
# ufw-not-local
#
-A ufw-before-input -j ufw-not-local

# if LOCAL, RETURN
-A ufw-not-local -m addrtype --dst-type LOCAL -j RETURN

# if MULTICAST, RETURN
-A ufw-not-local -m addrtype --dst-type MULTICAST -j RETURN

# if BROADCAST, RETURN
-A ufw-not-local -m addrtype --dst-type BROADCAST -j RETURN

# all other non-local packets are dropped
-A ufw-not-local -m limit --limit 3/min --limit-burst 10 -j ufw-logging-deny
-A ufw-not-local -j DROP

# allow MULTICAST mDNS for service discovery (be sure the MULTICAST line above
# is uncommented)
-A ufw-before-input -p udp -d 224.0.0.251 --dport 5353 -j ACCEPT

# allow MULTICAST UPnP for service discovery (be sure the MULTICAST line above
# is uncommented)
-A ufw-before-input -p udp -d 239.255.255.250 --dport 1900 -j ACCEPT

# don't delete the 'COMMIT' line or these rules won't be processed
COMMIT

# START OPENVP RULES
# NAT Table rules
*nat
:POSTROUTING ACCEPT [0:0]
#Allow traffic from OpenVPN client to enp0s3
-A POSTROUTING -s 10.8.0.0/8 -o enp0s3 -j MASQUERADE
COMMIT
# END OPENVPN RULES
EOF
 
mv /etc/default/ufw  /etc/default/ufw.copy

cat << EOF > /etc/default/ufw
# /etc/default/ufw
#

# Set to yes to apply rules to support IPv6 (no means only IPv6 on loopback
# accepted). You will need to 'disable' and then 'enable' the firewall for
# the changes to take affect.
IPV6=yes

# Set the default input policy to ACCEPT, DROP, or REJECT. Please note that if
# you change this you will most likely want to adjust your rules.
DEFAULT_INPUT_POLICY="DROP"

# Set the default output policy to ACCEPT, DROP, or REJECT. Please note that if
# you change this you will most likely want to adjust your rules.
DEFAULT_OUTPUT_POLICY="ACCEPT"

# Set the default forward policy to ACCEPT, DROP or REJECT.  Please note that
# if you change this you will most likely want to adjust your rules
DEFAULT_FORWARD_POLICY="ACCEPT"

# Set the default application policy to ACCEPT, DROP, REJECT or SKIP. Please
# note that setting this to ACCEPT may be a security risk. See 'man ufw' for
# details
DEFAULT_APPLICATION_POLICY="SKIP"

# By default, ufw only touches its own chains. Set this to 'yes' to have ufw
# manage the built-in chains too. Warning: setting this to 'yes' will break
# non-ufw managed firewall rules
MANAGE_BUILTINS=no

#
# IPT backend
#
# only enable if using iptables backend
IPT_SYSCTL=/etc/ufw/sysctl.conf

# Extra connection tracking modules to load. IPT_MODULES should typically be
# empty for new installations and modules added only as needed. See
# 'CONNECTION HELPERS' from 'man ufw-framework' for details. Complete list can
# be found in net/netfilter/Kconfig of your kernel source. Some common modules:
# nf_conntrack_irc, nf_nat_irc: DCC (Direct Client to Client) support
# nf_conntrack_netbios_ns: NetBIOS (samba) client support
# nf_conntrack_pptp, nf_nat_pptp: PPTP over stateful firewall/NAT
# nf_conntrack_ftp, nf_nat_ftp: active FTP support
# nf_conntrack_tftp, nf_nat_tftp: TFTP support (server side)
# nf_conntrack_sane: sane support
IPT_MODULES=""
EOF

# Abrimos el puerto y cargamos la nueva configuracion.

ufw allow 1194/udp
ufw disable
ufw enable

# Habilitamos el servicio y lo comprobamos

systemctl -f enable openvpn-server@server.service
systemctl start openvpn-server@server.service
systemctl status openvpn

# Creamos el script para la automatizacion de la creacion de los archivos *.ovn

mkdir -p ~/client-confs/files
cp /usr/share/doc/openvpn/examples/sample-config-files/client.conf ~/client-confs/base.conf.copy

cat << EOF > ~/client-confs/base.conf
client
;dev tap
dev tun
;dev-node MyTap
;proto tcp
proto udp
remote ip-publica 1194
;remote my-server-2 1194
;remote-random
resolv-retry infinite
nobind
;user nobody
;group nogroup
persist-key
persist-tun
;http-proxy-retry # retry on connection failures
;http-proxy [proxy server] [proxy port #]
;mute-replay-warnings
;ca ca.crt
;cert client.crt
;key client.key
remote-cert-tls server
;tls-auth ta.key 1
;cipher AES-256-CBC
cipher AES-256-GCM
auth SHA256
verb 3
;mute 20
# Additional Config
key-direction 1

; script-security 2
; up /etc/openvpn/update-resolv-conf
; down /etc/openvpn/update-resolv-conf

; script-security 2
; up /etc/openvpn/update-systemd-resolved
; down /etc/openvpn/update-systemd-resolved
; down-pre
; dhcp-option DOMAIN-ROUTE .
EOF


cat << EOF > ~/client-confs/make_config.sh
#!/bin/bash

# First argument: Client identifier

KEY_DIR=~/client-configs/keys
OUTPUT_DIR=~/client-configs/files
BASE_CONFIG=~/client-configs/base.conf

cat ${BASE_CONFIG} \
	<(echo -e '<ca>') \
	${KEY_DIR}/ca.crt \
	<(echo -e '</ca>\n<cert>') \
	${KEY_DIR}/${1}.crt \
	<(echo -e '</cert>\n<key>') \
	${KEY_DIR}/${1}.key \
	<(echo -e '</key>\n<tls-crypt>') \
	${KEY_DIR}/ta.key \
	<(echo -e '</tls-crypt>') \
	> ${OUTPUT_DIR}/${1}.ovpn
EOF

# Habilitamos la ejecucion solo a root y creamos los archivos *.ovpn

chmod 700 ~/client-confs/make_config.sh 

~/client-confs/./make_config.sh joan
~/client-confs/./make_config.sh alex
~/client-confs/./make_config.sh santi