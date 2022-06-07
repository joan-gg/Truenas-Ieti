# OPENVPN

Actualizamos todos los paquetes con el comando mostrado.

![pasted image 0](https://user-images.githubusercontent.com/84206194/118507511-96b8bc80-b72e-11eb-900a-dd42c9e334b0.png)

Instalamos los paquetes necesarios, easy-rsa para los certificados, ssh para pasar a los clientes el archivo de configuración, y el servidor openvpn

![pasted image 0 (1)](https://user-images.githubusercontent.com/84206194/118507557-a20be800-b72e-11eb-9095-5d763e4277ab.png)

Ahora en la raíz de root creamos la carpeta a donde tendremos los archivos del easy-rsa

![pasted image 0 (2)](https://user-images.githubusercontent.com/84206194/118507595-aafcb980-b72e-11eb-9ef5-0e94524a6744.png)

Creamos un enlace simbólico de la carpeta donde estan los archivos a la carpeta creada anteriormente

![pasted image 0 (3)](https://user-images.githubusercontent.com/84206194/118507636-b64fe500-b72e-11eb-9eee-e7ac0616c1a5.png)

Accedemos a la carpeta

![unnamed](https://user-images.githubusercontent.com/84206194/118507747-cf589600-b72e-11eb-8fce-9eea2cea8283.png)

Ahora creamos la base de nuestros certificados con nano vars

![image](https://user-images.githubusercontent.com/91555281/170895243-4c39b34e-c0df-4462-839f-ffbf0defddb0.png)

Añadimos estas líneas y las editamos a nuestra configuración

![image](https://user-images.githubusercontent.com/91555281/170895192-95415698-8bfc-4267-9314-ec0fdc824dea.png)

Ejecutamos el comando mostrado a continuación para crearlos.

![pasted image 0 (6)](https://user-images.githubusercontent.com/84206194/118507919-fadb8080-b72e-11eb-9479-c774fcb88c04.png)

Ahora creamos el certificado ca del servido con este comando

![pasted image 0 (7)](https://user-images.githubusercontent.com/84206194/118507940-0169f800-b72f-11eb-9cd1-260b576bc683.png)

Copiamos el ca y lo ponemos en la carpeta compartida de CA

![unnamed (1)](https://user-images.githubusercontent.com/84206194/118508021-147cc800-b72f-11eb-8fcb-b2007e0dde19.png)

Una vez cp ejecutamos un update, para que detecte el certificado creado.

![pasted image 0 (8)](https://user-images.githubusercontent.com/84206194/118508557-9836b480-b72f-11eb-957b-fd6f468d5a5a.png)

Creamos el req y la key para el servidor con el comando de mostrado abajo, cuando nos salga lo de Common Name, le damos a enter sin poner nada.

![pasted image 0 (9)](https://user-images.githubusercontent.com/84206194/118508592-9f5dc280-b72f-11eb-9dc6-c618476a638c.png)

Ahora firmamos el certificado del servidor creado.

![pasted image 0 (10)](https://user-images.githubusercontent.com/84206194/118508620-a4227680-b72f-11eb-973f-c1f91f39d0a3.png)

Ahora copiamos los certificados a la carpeta del servidor de openvpn

![pasted image 0 (11)](https://user-images.githubusercontent.com/84206194/118508655-aab0ee00-b72f-11eb-81a7-d44b5a75c04d.png)

Generamos la clave del servidor con este comando.

![pasted image 0 (12)](https://user-images.githubusercontent.com/84206194/118508783-c74d2600-b72f-11eb-8d10-4810f2c309a0.png)

Ahora la copiamos también a donde están los certificados del servidor openvpn

![pasted image 0 (13)](https://user-images.githubusercontent.com/84206194/118508812-cb794380-b72f-11eb-9a11-8b4adb05555f.png)

Ahora creamos la carpeta para los certificados y configuraciones de los clientes.

![pasted image 0 (14)](https://user-images.githubusercontent.com/84206194/118508826-d16f2480-b72f-11eb-846c-28e7b8d85ae2.png)

Ahora generamos los certificados para el cliente, cuando nos salgo lo del common name solo le damos a enter.

![pasted image 0 (15)](https://user-images.githubusercontent.com/84206194/118508839-d633d880-b72f-11eb-9ab6-58e1584d1c56.png)

Ahora copiamos los certificados a la carpeta creada para ello.

![pasted image 0 (16)](https://user-images.githubusercontent.com/84206194/118508867-dcc25000-b72f-11eb-9ed3-3e905b332477.png)

Firmamos el certificado del cliente.

![pasted image 0 (17)](https://user-images.githubusercontent.com/84206194/118508893-e1870400-b72f-11eb-9462-b8750b1afb16.png)

Y copiamos el certificado ca, el ta y el crt a la carpeta keys de los clientes.

![pasted image 0 (18)](https://user-images.githubusercontent.com/84206194/118508917-e64bb800-b72f-11eb-9f66-9488b2365301.png)

Cogemos la configuración base de share y la copiamos a la carpeta del openvpn server

![pasted image 0 (19)](https://user-images.githubusercontent.com/84206194/118508947-ec419900-b72f-11eb-94ab-d1bfdd85054d.png)

Extraemos con gunzip el zip copiado

![pasted image 0 (20)](https://user-images.githubusercontent.com/84206194/118508965-f06db680-b72f-11eb-9b4c-6e3804dff485.png)

Ahora editamos la configuración del server.conf y editamos las configuraciones tal y como se muestran en la pantalla.

![pasted image 0 (21)](https://user-images.githubusercontent.com/84206194/118508979-f499d400-b72f-11eb-8c9a-aa2733ccac8d.png)

Quitamos el dh

![pasted image 0 (22)](https://user-images.githubusercontent.com/84206194/118509007-fa8fb500-b72f-11eb-9c0f-df8d0ed767ac.png)

Creamos la ruta para acceder a los ordenadores de la red

![image](https://user-images.githubusercontent.com/91555281/172222079-9fd94ad9-b419-46a3-ba3e-84d8e83e6dcf.png)

Deshabilitamos el auth y ponemos el crypth para ganar seguridad.

![pasted image 0 (24)](https://user-images.githubusercontent.com/84206194/118509191-20b55500-b730-11eb-9f51-73fba7298d9f.png)

Cambiamos el cipher por el nuestro y ponemos que el auth es de SHA252

![pasted image 0 (25)](https://user-images.githubusercontent.com/84206194/118509224-257a0900-b730-11eb-9960-2dee4ec15381.png)

Ponemos un máximo de clientes al mismo tiempo

![pasted image 0 (26)](https://user-images.githubusercontent.com/84206194/118509252-2ad75380-b730-11eb-8c95-bd962ab535c0.png)

Ahora activamos el forward

![pasted image 0 (27)](https://user-images.githubusercontent.com/84206194/118509281-30cd3480-b730-11eb-8f7b-83cd33a12c7e.png)

Quitamos “#” de la línea que muestro a continuación

![pasted image 0 (28)](https://user-images.githubusercontent.com/84206194/118509319-362a7f00-b730-11eb-8748-60f6c369d2fc.png)

Cargamos la configuración y no aseguramos de que nos salga esto.

![pasted image 0 (29)](https://user-images.githubusercontent.com/84206194/118509359-3fb3e700-b730-11eb-8dc9-49bb02f3c183.png)

Ahora editamos el firewall, para crear las rutas para el forward, indefinidamente

![pasted image 0 (30)](https://user-images.githubusercontent.com/84206194/118509382-44789b00-b730-11eb-872f-634d01fdb6d4.png)

Añadimos esta líneas por el principio del documento.

![pasted image 0 (31)](https://user-images.githubusercontent.com/84206194/118509406-493d4f00-b730-11eb-87c9-607bee243411.png)

Ahora editamos el ufw, para también habilitar el forward

![pasted image 0 (32)](https://user-images.githubusercontent.com/84206194/118509425-4d696c80-b730-11eb-963a-6576803ff796.png)
![pasted image 0 (33)](https://user-images.githubusercontent.com/84206194/118509515-62de9680-b730-11eb-8ac5-6c44d97e3d4a.png)

Habilitamos el puerto 1194/udp, que es el que utiliza openvpn

![pasted image 0 (34)](https://user-images.githubusercontent.com/84206194/118509543-696d0e00-b730-11eb-80ee-b87bfe4de46c.png)

Desactivamos y activamos el firewall para actualizar.

![unnamed (2)](https://user-images.githubusercontent.com/84206194/118509573-6ffb8580-b730-11eb-839e-179f4802ac0f.png)

Creamos el servicio para activar el servidor con un systemctl

![pasted image 0 (35)](https://user-images.githubusercontent.com/84206194/118509830-b3ee8a80-b730-11eb-9973-d3d0820f5eaf.png)

Iniciar servicio

![pasted image 0 (36)](https://user-images.githubusercontent.com/84206194/118509847-b81aa800-b730-11eb-9edd-404fd6ae5a04.png)

Ahora creamos la carpeta files, para almacenar los ovpn de los clientes

![pasted image 0 (37)](https://user-images.githubusercontent.com/84206194/118509862-bc46c580-b730-11eb-9e2c-24115c2c7dd4.png)

Copiamos la configuración base de los clientes y la pasamos a la raiz de la carpeta de los clientes.

![pasted image 0 (38)](https://user-images.githubusercontent.com/84206194/118509886-c23ca680-b730-11eb-9760-08ca9933fb7b.png)

Ahora editamos la base para todos los clientes

![pasted image 0 (39)](https://user-images.githubusercontent.com/84206194/118509909-c5d02d80-b730-11eb-9961-6357024e6edf.png)

En remote ponemos la ip publica del ordenador para acceder desde una red de fuera.

![pasted image 0 (40)](https://user-images.githubusercontent.com/84206194/118509945-cb2d7800-b730-11eb-8e69-bc9f237b55ee.png)

Ahora deshabilitamos los cert antiguos poniendo un “;” antes de cada uno 

![pasted image 0 (41)](https://user-images.githubusercontent.com/84206194/118509959-cec0ff00-b730-11eb-86d2-8a478dac4a3e.png)

Quitamos el ta.key

![pasted image 0 (42)](https://user-images.githubusercontent.com/84206194/118509974-d2ed1c80-b730-11eb-8d0e-78205da87749.png)

Volvemos a añadir las líneas del cipher y auth

![pasted image 0 (43)](https://user-images.githubusercontent.com/84206194/118509997-d7b1d080-b730-11eb-84c6-f51a8a0c79cb.png)

Al final del documento ponemos estas líneas

![pasted image 0 (44)](https://user-images.githubusercontent.com/84206194/118510020-ded8de80-b730-11eb-83e1-f18a0a3c5cfc.png)

Ahora creamos el script de creación de los ovpn de los clientes para automatizar el proceso.

![pasted image 0 (45)](https://user-images.githubusercontent.com/84206194/118510043-e39d9280-b730-11eb-9015-2d4f4b8d8ed1.png)

Lo que hace el script, es coger los directorios de las keys, la files y el base.conf.
Después los copia con un cat y un echo,  por orden y lo exporta a la carpeta files, con el nombre que le pongas al cargar el script.

![pasted image 0 (46)](https://user-images.githubusercontent.com/84206194/118510075-e8624680-b730-11eb-817c-92e3ae428768.png)

Le damos permisos sólo al root

![pasted image 0 (47)](https://user-images.githubusercontent.com/84206194/118510101-ee582780-b730-11eb-819c-d8ecf9bbff3d.png)

Accedemos a la carpeta donde esta el script.

![pasted image 0 (48)](https://user-images.githubusercontent.com/84206194/118510120-f31cdb80-b730-11eb-93b7-2bb37709f622.png)

Ahora ejecutamos el script con un nombre de cliente, y se creara el archivo automaticamente.

![pasted image 0 (49)](https://user-images.githubusercontent.com/84206194/118510143-f7e18f80-b730-11eb-994c-cff6f0e7d705.png)

Ahora solo faltaria que el cliente cargue el archivo ovpn en su máquina y se conecte.
