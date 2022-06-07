**Configuración de nuestro NAS para guardar los backups de nuestros clientes**

Primero nos dirigimos a Storage --> Pools y añadimos un nuevo dataset, el cual almacenará los backups

![image](https://user-images.githubusercontent.com/91557892/172247975-d9b7cd49-e76c-4401-bf00-f293e7adb73f.png)

Le ponemos el nombre que queramos y en share type le indicamos que sea SAMBA

![image](https://user-images.githubusercontent.com/91557892/172248098-87619620-7693-4d74-be68-c583c12b944c.png)
![image](https://user-images.githubusercontent.com/91557892/172248116-89d5a838-e643-4656-9182-d0dcfe915813.png)

Ahora nos dirigimos a Sharing --> SMB y compartimos el recurso que acabamos de crear con SAMBA

![image](https://user-images.githubusercontent.com/91557892/172248277-d523bf75-75ee-4eec-bb35-ae9f92837843.png)

Ahora crearemos un usuario para administrar esta carpeta (En este proceso, cada cliente tendrá su propio usuario y lo mismo con su carpeta, a la cual solo el tendrá acceso)

Nos dirigimos a Accounts --> Users y hacemos click en Add

Indicamos su nombre

![image](https://user-images.githubusercontent.com/91557892/172248601-050b80bb-893d-456f-9657-8cc1660fb09a.png)

Una contraseña

![image](https://user-images.githubusercontent.com/91557892/172248658-9fd0892d-8f5e-4f06-b30c-4cd2cfa71f86.png)

Y el recurso al cual tendrá acceso(Recordar que este proceso será personalizado para cada usuario)

![image](https://user-images.githubusercontent.com/91557892/172248724-ecedf75f-4981-49ec-844c-15b85d46e0ce.png)

Nos dirigimos de nuevo a Sharing --> SMB y hacemos click en edit filesystem

![image](https://user-images.githubusercontent.com/91557892/172248921-39a2b48f-ac4e-4963-9933-db823e0e657d.png)

Comprobamos que el usuario propietario de la carpeta es el recientemente creado

![image](https://user-images.githubusercontent.com/91557892/172249113-2cd6a81d-50cb-46aa-b94f-57addebaec44.png)

Bloqueamos el acceso a el resto de usuarios

![image](https://user-images.githubusercontent.com/91557892/172249168-ac143cf8-6f82-4408-8a31-d3ea852c2c55.png)

Y miramos que el propietario tenga libertad sobre la carpeta 

![image](https://user-images.githubusercontent.com/91557892/172249229-bfea6465-6361-4a6f-b62a-a9d5b164f154.png)

Guardamos y ya tendríamos todo configurado, ahora los clientes deberán conectarse a el servidor y realizar los backups


