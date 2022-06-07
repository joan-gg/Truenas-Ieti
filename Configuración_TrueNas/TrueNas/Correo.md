# Configuración de Correo con TrueNAS

Vamos a añadir un correo electrónico en el cual nos llegarán las notificaciones del servidor, para ello nos dirigimos a System ---> Email

![mail1](https://user-images.githubusercontent.com/84206194/118336304-aeffc000-b511-11eb-8335-53d3b219bd3f.png)

Una vez Aquí introducimos el correo deseado, el nombre en el que llegara el correo, despues seleccionamos la opción de SMTP, ya que el GMail OAuth a veces da problemas, entonces, una vez tenemos puesta la opción SMTP, le ponemos el servidor de gmail que es "smtp.gmail.com", despues ponemos su puerto "465" y ponemos la opción de SSL y marcamos la opción de "SMTP Authentication", solo nos faltaria poner en "Username" el correo y la contraseña del correo.

![image](https://user-images.githubusercontent.com/91555281/170896867-bfd4a873-3651-4df8-a748-244575222dfa.png)

Y nos debería llegar un correo como este:
 
![mail6](https://user-images.githubusercontent.com/84206194/118336367-d191d900-b511-11eb-8a95-5680e559bff8.png)

![image](https://user-images.githubusercontent.com/91555281/170897116-ee3c4dce-9262-4eca-a1ec-3e4c29785ec3.png)
