#!/bin/bash

# Accedemos a la carpeta donde se crean los certs

cd ~/easy-rsa

# Creamos los certificados de los usuarios

/root/easy-rsa/./easyrsa gen-req ${1} nopass
cp ~/easy-rsa/pki/private/${1}.key ~/client-confs/keys/

# Firmamos los certificados de los usuarios

/root/easy-rsa/./easyrsa sign-req client ${1}
cp ~/easy-rsa/pki/issued/${1}.crt ~/client-confs/keys/