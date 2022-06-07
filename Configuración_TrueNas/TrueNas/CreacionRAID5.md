# Creación del sistema RAID 5

Como hemos dicho anteriormente, hemos decidido crear un sistema de RAID 5 para asegurar una mayor seguridad de los datos almacenados en el NAS, para ello, nos dirigimos a el apartado de Storage ---> Pools.

![unnamed](https://user-images.githubusercontent.com/84206194/118334508-0ef46780-b50e-11eb-99d6-5f82bdd28bea.png)



Añadimos una Pool.

![pasted image 0](https://user-images.githubusercontent.com/84206194/118334758-832f0b00-b50e-11eb-96a6-00998b9c60ac.png)



Creamos nueva Pool.

![pasted image 0 (1)](https://user-images.githubusercontent.com/84206194/118334822-9fcb4300-b50e-11eb-8baa-394a675c88f1.png)


Le añadimos un nombre a la Pool, en nuestro caso la llamaremos RAID5, seleccionamos los discos y en la opción de Raid, elegimos RAID-Z el qual configura los discos como un RAID-5.
Finalmente hacemos click en Create

![pasted image 0 (2)](https://user-images.githubusercontent.com/84206194/118334852-b2457c80-b50e-11eb-8867-ab397bf8afdf.png)



Este aviso salta diciendo que en el caso de comenzar el RAID, el contenido de los discos será eliminado, en nuestro caso como no tenemos información ya que los discos no nuevos confirmaremos y crearemos la Pool.

![pasted image 0 (3)](https://user-images.githubusercontent.com/84206194/118334875-bd001180-b50e-11eb-932e-ba6856becf14.png)

Finalmente podemos ver las Pools creadas en la sección de Pools.

![pasted image 0 (4)](https://user-images.githubusercontent.com/84206194/118334901-c7221000-b50e-11eb-8436-90b6c2be9b99.png)
