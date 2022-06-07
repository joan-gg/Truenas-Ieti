
Lo primero que tenemos que hacer es dirigirnos a Grafana, al apartado de Alerts --> Contact points y creamos uno nuevo

![image](https://user-images.githubusercontent.com/91557892/171190096-c85175c6-ab57-4053-827b-bbbf074a6b26.png)

Ahora antes de darle a save, hay que editar el SMTP de Grafana desde su archivo de configuración, para ello nos dirigimos a la jail donde está instalado Influxdb y Grafana, y accedemos a /usr/local/share/grafana/conf/defaults.ini, bajamos hasta el apartado de SMTP y lo configuramos como en la siguiente captura: (Obviamente introduciendo tus datos)

![image](https://user-images.githubusercontent.com/91557892/171191341-1faedf28-b6e2-4931-8017-839cbbca0dd3.png)

Ahora ya podemos dirigirnos a donde estabamos antes, probar si nos envia la alerta y en caso afirmativo, le damos a guardar. 

Nos llegará una alerta como esta:

![image](https://user-images.githubusercontent.com/91557892/171195250-dcb927f9-bafe-4810-a086-9bb5764a36b9.png)

Ahora nos dirigimos a el apartado de Notification policies, y seleccionamos el Contact point recientemente creado

![image](https://user-images.githubusercontent.com/91557892/171195701-a6009b4d-4247-45d7-a59f-c404099a7273.png)

Y ahora solo queda crear las alertas, para ello nos vamos al dashboard y elegimos el panel del cual queremos hacer la alerta, en este caso utilizaré el del uso de la CPU, vamos a el apartado de alertas y hacemos click en create alert rule from this panel

![image](https://user-images.githubusercontent.com/91557892/171197834-16d76b5c-8fdb-4aea-92f2-c1971176aa41.png)

Ahora primero elegimos el nombre le la alerta, el tipo de alerta y el folder, en caso de que no tengamos folder hay que crearlo manualmente en el apartado de Folders de Grafana

![image](https://user-images.githubusercontent.com/91557892/171198435-7268d703-5211-4986-bb22-471473231394.png)

Ahora respecto a la query de arrriba, hay que indicarle cuando queremos que salte la alerta, en este caso cuando la CPU esté al 70%

![image](https://user-images.githubusercontent.com/91557892/171198861-92883e2a-13af-4818-b405-0320d9475ac6.png)

En este apartado elegimoos cada cuando queremos que la alerta sea escaneada y tambíen el comentario que queremos que salga dependiendo del problema que haya

![image](https://user-images.githubusercontent.com/91557892/171199334-7789bb1d-b584-4168-b13c-64a6a367be1b.png)

Y finalmente el comentario que queremos que salga como aviso en el correo

![image](https://user-images.githubusercontent.com/91557892/171199909-07a2546e-6a58-4190-9a33-cef016c910c0.png)

Y debería llegarnos una alerta como esta al correo:

![image](https://user-images.githubusercontent.com/91557892/171200128-78d6daa8-2e41-4159-9c2d-e528a8c3c1ea.png)



