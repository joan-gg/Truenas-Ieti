# **Configuración Plex**

Nos conectamos por ssh o usamos el propio shell de TrueNas y creamos el archivo .json para la instalación

`nano plex.json`

    {
    "name": "Plex",
    "release": "12.2-RELEASE",
    "artifact": "https://github.com/freenas/iocage-plugin-plexmediaserver.git",
    "official": "false",
    "properties": {
        "dhcp": 1
    },
    "pkgs": [
        "plexmediaserver",
        "ffmpeg"
    ],
    "packagesite": "http://pkg.freebsd.org/$%7BABI%7D/latest",
    "fingerprints": {
        "iocage-plugins": [
            {
                "function": "sha256",
                "fingerprint": "b0170035af3acc5f3f3ae1859dc717101b4e6c1d0a794ad554928ca0cbb2f438"
            }
        ]
    },
    "revision": "0"
    }
Y una vez creado, lo instalamos

`iocage fetch -P plex.json`

Creamos la jail

`iocage create -n "plexmediaserver" -r 12.2-RELEASE vnet="on" bpf="yes" dhcp="on" allow_raw_sockets="1" boot="on" interfaces="vnet0:bridge0"`

Entramos en la jail

`iocage console plexmediaserver`

Activamos el Servicio

`sysrc "plexmediaserver_enable=YES"`

Añadimos el grupo que se puede autentica y el usuario.

`nano /urc/local/etc/rc.d/plexmediaserver`

`${plexmediaserver_user="root"}
${plexmediaserver_group="plexgroup"}`

Entramos mediante esta url.

`http://server-ip:32400/`


![image](https://user-images.githubusercontent.com/84206290/119529165-23dcc080-bd82-11eb-939d-d3d828d0f3e3.png)

Le ponemos nombre al servidor.

![image](https://user-images.githubusercontent.com/84206290/119529252-37882700-bd82-11eb-8564-0128cb33302a.png)


Le damos a siguiente ya que tenemos que crear el directorio compartido donde queremos guardar los videos.

![image](https://user-images.githubusercontent.com/84206290/119529854-c432e500-bd82-11eb-87b7-4224db824167.png)


Y le damos a Fet.

![image](https://user-images.githubusercontent.com/84206290/119529972-dd3b9600-bd82-11eb-8d60-48141472fd27.png)


**Samba**

Anyadimos el servicio de samba


![image](https://user-images.githubusercontent.com/84206290/119530474-53d89380-bd83-11eb-9677-2b9b2c8c1bee.png)

Y la compartimos en red.

![image](https://user-images.githubusercontent.com/84206290/119530633-7b2f6080-bd83-11eb-895f-39e6eeec9aa6.png)

Editamos las ACL del recurso.

![image](https://user-images.githubusercontent.com/84206290/119530741-97330200-bd83-11eb-9bf7-c735b0684f60.png)


Vamos a la jail y escribimos id plex, para ver el id

![image](https://user-images.githubusercontent.com/84206290/119530836-aca82c00-bd83-11eb-945b-034978a1b536.png)


Anyadimos una ACL de user con la id del plex, para que puedan entrar los usuarios.

![image](https://user-images.githubusercontent.com/84206290/119530910-be89cf00-bd83-11eb-8cab-6fea4c61c1ea.png)


Una vez hecho esto ya pueden los usuarios plex acceder al recurso compartido.

![image](https://user-images.githubusercontent.com/91557892/171187746-0aab912f-a6ed-4e11-a5ae-9289fdd8c1a5.png)

**Mount Point**

Ahora tenemos que montar el samba dentro de la JAIl, para ello vamos a mount point.

![image](https://user-images.githubusercontent.com/84206290/119531340-1c1e1b80-bd84-11eb-8c1a-2e187f836a15.png)

Y le damos a Add

![image](https://user-images.githubusercontent.com/84206290/119531419-2dffbe80-bd84-11eb-9595-9c566ef774a2.png)

Lo montamos dentro del jail.

![image](https://user-images.githubusercontent.com/84206290/119531512-4a036000-bd84-11eb-97e4-7a6a846f36bb.png)


Ya podemos seguir con samba, clicamos en el servidor.

![image](https://user-images.githubusercontent.com/84206290/119531706-7d45ef00-bd84-11eb-904e-cf150a56450a.png)


Y anyadimos los dos recursos.

![image](https://user-images.githubusercontent.com/84206290/119531884-a797ac80-bd84-11eb-8cc5-6d4e18878d0f.png)


![image](https://user-images.githubusercontent.com/84206290/119532984-b29f0c80-bd85-11eb-9d04-f0b85873c117.png)


Y ya tendremos las bibliotecas.

![image](https://user-images.githubusercontent.com/84206290/119532347-170d9c00-bd85-11eb-82b2-4f5da31b4613.png)


Si tenemos peliculas dentro del samba para sincronizarla, clicamos en la biblioteca,en los tres puntos y le damos a actualizar metadatos.

![image](https://user-images.githubusercontent.com/84206290/119532684-648a0900-bd85-11eb-8452-de60d76f10b1.png)

Y se nos sincronizarían las peliculas.

![image](https://user-images.githubusercontent.com/84206290/119532787-7f5c7d80-bd85-11eb-814a-3dafce4416ac.png)


