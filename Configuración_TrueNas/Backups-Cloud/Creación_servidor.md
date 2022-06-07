# Creación de Backups de TrueNas

Lo primero que tenemos que hacer es Dirigirnos a System ---> Cloud Credentials y hacer click en el botón de Add.

![image](https://user-images.githubusercontent.com/91557892/170896308-2fa647d7-a594-41c8-bce3-5abcbd7f9855.png)

Elegimos un nombre, y como en nuestro caso utilizaremos BackBlaze para almacenar las copias de seguridad, en el apartado de Provider, elegimos Backblaze B2.

![image](https://user-images.githubusercontent.com/91557892/170896319-56bcdf62-5797-4959-ab2a-3f55d227b7eb.png)

Ahora antes de seguir, tenemos que crear una cuenta en Backblaze.

Y una vez creada la cuenta nos dirigimos a app keys.

![image](https://user-images.githubusercontent.com/84206194/119859726-f0329f80-bf15-11eb-834e-f66b94817b3a.png)

Y hacemos click en Generate New Master Aplication Key.

![image](https://user-images.githubusercontent.com/91557892/170896274-a7f217f1-d97e-4440-af7a-63a405512aa2.png)

Ahora nos generará una nueva clave maestra, pero solo se mostrará 1 vez, así que mejor guardarla en algún lado.

![image](https://user-images.githubusercontent.com/91557892/170896249-b0640b8d-c01e-4d5d-89d3-d248ac0f1e76.png)

Una vez tengamos las keys, las introducimos en el TrueNas.

![image](https://user-images.githubusercontent.com/91557892/170896193-62710946-7326-427d-9947-50f620079718.png)

Le damos a verify credentials y si nos sale un mensage como este:

![image](https://user-images.githubusercontent.com/84206194/119860738-efe6d400-bf16-11eb-9bf2-6a08b3e64886.png)

Es que las credenciales son validas, por tanto podemos hacer click en submit.

![image](https://user-images.githubusercontent.com/91557892/170896388-0496067c-3104-493c-a1ea-cb1eaae65698.png)

Ahora volvemos a backblaze y nos dirigimos a el apartado de buckets y creamos un nuevo bucket.

![da](https://user-images.githubusercontent.com/91557892/170896091-f12a4e19-4829-4a56-a4ee-e5d3abcba537.PNG)

Le ponemos un nombre y hacemos click en Create Bucket.

![dd](https://user-images.githubusercontent.com/91557892/170896057-1ad3cf2d-1ef6-42b2-9c77-4bae3c4d8bba.PNG)

![image](https://user-images.githubusercontent.com/84206194/119861140-5966e280-bf17-11eb-9e69-4df51f6d95e0.png)

Y ya tenemos nuestro cubo creado, en el cual se crearán los backups.

![de](https://user-images.githubusercontent.com/91557892/170896110-bf880e7b-61dc-4e6b-a8b6-ca5c9da1f78c.PNG)

