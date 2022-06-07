# NextCloud

Ahora instalaremos NextCloud, el cual utilizaremos como interfaz grafica para el TrueNAS.

Para ello, necesitamos conectarnos al servidor por ssh mediante una maquina externa.

Una vez hecho esto, comenzamos con la instalación.

Primero creamos el archivo .json que utilizaremos para instalar NextCloud

**nano nextcloud.json**

Y introducimos el siguiente contenido:


    {

    "name": "Nextcloud",
    
    "plugin_schema": "2",
    
    "release": "12.2-RELEASE",
    
    "artifact": "https://github.com/EliasGabrielsson/iocage-plugin-nextcloud.git",
    
    "official": false,
    
    "properties": {
    
        "nat": 1,
        
        "nat_forwards": "tcp(80:8282)"
        
    },
    
    "pkgs": [
    
        "ffmpeg",
        
        "nextcloud-php74",
        
        "php74-pecl-imagick-im7",
        
        "php74-bcmath",
        
        "php74-gmp",
        
        "php74-pcntl",
        
        "nginx",
        
        "mysql80-server"
        
    ],
    
    "packagesite": "http://pkg.FreeBSD.org/${ABI}/latest",
    
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


Guardamos la configuración y ahora utilizamos el siguiente comando para ejecutar el archivo .json y de esta forma poder instalar el plugin.

**iocage fetch -P nextcloud.json**

Por ultimo nos faltaria editar el config.php para que nos permita acceder por nuestro dominio.

`nano /usr/local/www/nextcloud/config/config.php`

Y dentro añadimos en trusted_domains

`2 => 'nc.ietinas.tk',`

Ahora si nos dirigimos a un buscador y introducimos la siguiente URL:

https://nc.ietinas.tk

Nos debería aparecer una ventana como esta:

![Captura de pantalla a 2021-05-17 16-29-52](https://user-images.githubusercontent.com/84206194/118506147-59076400-b72d-11eb-8b30-de7d47af1a6c.png)

El usuario y contraseña del administrador que se utilizarán para entrar a NextCloud se generan automaticamente al instalar este Plugin, para poder saberlos, tenemos que ir a el apartado de Plugins.

![image](https://user-images.githubusercontent.com/91555281/170895723-d2cfcc8b-3fd4-4f5c-8567-43670b3000e0.png)

 Una vez estemos aquí,tenemos que dirirnos donde dice POST INSTALL NOTES, donde nos dirá toda la información que necesitamos.

![Captura de pantalla a 2021-05-17 16-35-11](https://user-images.githubusercontent.com/84206194/118506736-df23aa80-b72d-11eb-9312-a25240d95349.png)

Ahora ya podemos entrar a NextCloud, y lo que veremos la primera vez que entremos, será algo parecido a esto

![Captura de pantalla a 2021-05-17 16-36-03](https://user-images.githubusercontent.com/84206194/118506933-0a0dfe80-b72e-11eb-9afc-ad2cd8d764be.png)
