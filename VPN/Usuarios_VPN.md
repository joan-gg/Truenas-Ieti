# CREAR NUEVOS CLIENTES 

cd ~/easy-rsa

./easyrsa gen-req client2 nopass

cp pki/private/client2.key ~/client-configs/keys/

./easyrsa sign-req client client2

cp pki/issued/client2.crt ~/client-configs/keys/

cd ~/client-configs

./Script-OVPN-Files.sh client2
