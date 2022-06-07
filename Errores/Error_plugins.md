# Error con la instalación de Plug-ins

Normalmente los Plug-ins de TrueNas se instalan mediante el botón de instalación de estos.

![image](https://user-images.githubusercontent.com/84206194/120072604-e7b4a300-c094-11eb-975a-bbd922a7cb12.png)

Se elige el nombre de la Jail, si lo queremos en DHCP o NAT e incluso podemos ponerle una IP en específico y finalmente se instala.

![image](https://user-images.githubusercontent.com/84206194/120072690-60b3fa80-c095-11eb-85ba-a82cdf3b0db6.png)

Esto nos dio muchos problemas, ya que a veces no detecta el dhcp, las IPs que da no son correctas o incluso hay veces que falla la instalación y el plug-in no se instala correctamente.

Esto lo hemos solucionado utilizando archivos .json para realizar la instalación, las opciones para crear los archivos pueden ser mediante el propio shell de TrueNas o conectarse por ssh.

Un ejemplo es el .json del plug-in de Plex:

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

De hecho las opciones que podemos elegir son las mismas, la única diferencia es que en caso de utilizar nat en vez de dhcp para la instalación, tenemos que definir el puerto que utilizaremos y en caso de que tenga más de 1 también.

