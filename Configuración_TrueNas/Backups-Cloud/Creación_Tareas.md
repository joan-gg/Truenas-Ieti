# Creación de la tarea

Lo que haremos ahora será crear una tarea para que las copias de seguridad se hagan automaticamente.

Para ello nos dirigimos a Tasks ---> Cloud Sync Tasks y hacemos click en Add

![image](https://user-images.githubusercontent.com/84206194/119861842-207b3d80-bf18-11eb-86b6-8365168b295d.png)

Ahora empezamos a rellenar los datos:

Description: Lo que queramos

Credential: Hay que elegir las credenciales añadidas anteriormente (backblazecloud B2)

Direction: Push (Ya que lo que queremos es subir el backup a la nuve)

Bucket: trueietibucket

Transfer mode: Sync 

Directory files: La carpeta de la cual queremos hacer el backup (En nuestro caso elegiremos solo la carpeta compartida en Samba).

![image](https://user-images.githubusercontent.com/91557892/170896520-7a244d77-d8ff-4661-8c9e-2843a02b981c.png)

Ahora en el apartado de Control elegimos cada cuanto queremos que se haga la copia de seguridad, en nuestro caso queremos una copia diaria.

![image](https://user-images.githubusercontent.com/84206194/119863829-46094680-bf1a-11eb-9574-08a920099dad.png)

Y finalmente hacemos click en SUBMIT

![image](https://user-images.githubusercontent.com/84206194/119864859-5bcb3b80-bf1b-11eb-8208-1f0087eadc05.png)

Ahora solo queda iniciar la tarea, hacemos click en Run Now

![image](https://user-images.githubusercontent.com/91557892/170896560-94c31ea2-e17e-470a-be0f-80dcbef60420.png)

Y continue

![image](https://user-images.githubusercontent.com/84206194/119865083-97660580-bf1b-11eb-8cfa-4920c9a095e6.png)

Esperamos a que finalize el backup

![image](https://user-images.githubusercontent.com/91557892/170896629-f9dd2aa1-64e4-423d-8004-24041b209af7.png)

Una vez finalize la copia de seguridad, en Backblaze nos dirigimos a Browse files ---> trueietibucket

![image](https://user-images.githubusercontent.com/91557892/170896720-d586fa2b-88c9-4e37-87b4-68178dc27e8d.png)

Y podremos ver todo el contenido del backup realizado, en este caso de la carpeta de SAMBA

![image](https://user-images.githubusercontent.com/91557892/170896742-81aa1477-4aa8-4caf-81d2-33d657de37a6.png)
