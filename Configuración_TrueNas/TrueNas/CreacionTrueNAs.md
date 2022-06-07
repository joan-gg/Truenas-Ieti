# **Creación de TrueNAS**


TrueNAS necesita bastantes requisitos, es por eso que le añadiremos 8 procesadores.

![unnamed1](https://user-images.githubusercontent.com/84206194/118332978-34cc3d00-b50b-11eb-8732-e2542ecafb6d.png)



También le añadimos 8GB de RAM.

![unnamed2](https://user-images.githubusercontent.com/84206194/118333199-9d1b1e80-b50b-11eb-9ccd-6582b890a95a.png)


Y finalmente 4 discos duros, esto se debe a que hemos decidido crear un RAID 5 en el servidor para asegurar la información almacenada en este.

![unnamed3](https://user-images.githubusercontent.com/84206194/118333227-a4dac300-b50b-11eb-9c13-850639168843.png)



Seleccionamos la opción “1”.

![unnamed4](https://user-images.githubusercontent.com/84206194/118333263-b0c68500-b50b-11eb-911c-b86ef68029b3.png)



En esta opción le damos, a la opción 1, ya que queremos instalar el sistema.

![unnamed5](https://user-images.githubusercontent.com/84206194/118333282-b7ed9300-b50b-11eb-906e-f796ff08cedd.png)




Seleccionamos el disco con el espacio del teclado, y después a “Ok”.

![unnamed6](https://user-images.githubusercontent.com/84206194/118333308-c20f9180-b50b-11eb-8636-8c22a0a1d7a4.png)



Ahora nos preguntará si queremos proceder con la instalación, en caso afirmativo, elegomos la opción Yes.

![unnamed7](https://user-images.githubusercontent.com/84206194/118333321-c9cf3600-b50b-11eb-9d69-3a21a95df82a.png)



Le ponemos una contraseña al usuario root.

![unnamed8](https://user-images.githubusercontent.com/84206194/118333337-d05dad80-b50b-11eb-9ce3-603f2d61e663.png)




Ahora elegimos si nuestra bios es “Bios” o “UEFI” para bootearlo, en nuestro caso elegimos Bios.

![unnamed9](https://user-images.githubusercontent.com/84206194/118333351-d784bb80-b50b-11eb-9c3f-448722524a92.png)



Creamos la partición swap, con el tamaño de la memoria ram y le damos a “Create swap”.

![unnamed10](https://user-images.githubusercontent.com/84206194/118333361-dd7a9c80-b50b-11eb-8a15-9e6a52abeee0.png)




Ahora nos dice que la instalación ha finalizado y que debemos reiniciar el sistema ademas de eliminar la ISO de TrueNas, por tanto seleccionamos OK,

![unnamed11](https://user-images.githubusercontent.com/84206194/118333380-e3707d80-b50b-11eb-9fc8-987cdc9e4701.png)



Y finalmente decidimos si reiniciamos o apagamos la maquina.

![unnamed12](https://user-images.githubusercontent.com/84206194/118333394-ec614f00-b50b-11eb-8d76-2892d25baa16.png)



Una vez iniciamos de nuevo, nos saldrá esta configuración, donde nos dirá la ip para acceder visualmente al true nas.

![image](https://user-images.githubusercontent.com/91557849/172256816-8a6e9191-1f06-449e-93c3-619cfa349b5d.png)


Accedemos a la ip con https y la dirección ip de la maquina.

![image](https://user-images.githubusercontent.com/91557849/171188816-bb82fda6-d3a5-4b0d-86b8-0df53bf53a16.png)


Una vez cargada la página web ponemos el usuario “root” y la contraseña escrita en la instalación realizada en el apartado anterior.

![image](https://user-images.githubusercontent.com/91557849/171189066-619e7436-f54e-48a3-9d5f-7066019c0f99.png)


Finalmente podemos ver el menú principal de TrueNAS.

![image](https://user-images.githubusercontent.com/91557849/171189649-2644cad0-35b2-463c-8c11-63953f9d9cad.png)

