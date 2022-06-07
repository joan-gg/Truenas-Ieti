
# Creamos la jail para el influx.

Le ponemos un nombre y seleccionamos la version del sistema de la jail

![image](https://user-images.githubusercontent.com/91557849/170895604-c0bf01b3-8014-4628-845b-b56699a532c2.png)

Ponemos la jail por "DHCP" y le damos a "Next"

![image](https://user-images.githubusercontent.com/91557849/170895615-65aeda40-9a98-49a2-a2c7-4ad274af451d.png)

Comprobamos que este todo bien y finalizamos con "Submit"

![image](https://user-images.githubusercontent.com/91557849/170895620-d218abf4-4895-42ca-b63e-498c412c217e.png)

# Instalación Influx / Grafana

Lo primero que realizamos es la instalación del influxdb y el grafama

`pkg install -y nano influxdb grafana7`

Una vez instalado los 2 paquetes, instalamos los plugins necesarios, para el correcto funcionamiento del dashboard que añadiremos en el grafana

`pkg grafana-cli plugins install grafana-worldmap-panel`

`pkg grafana-cli plugins install savantly-heatmap-panel`

`pkg grafana-cli plugins install grafana-piechart-panel`

`pkg grafana-cli plugins install grafana-clock-panel`

Ahora habilitamos los servicios en la jail.

`sysrc influxd_enable="YES"`

`sysrc grafana_enable="YES"`

Por ultimo iniciamos los 2 servicios

`service influxd start`

`service grafana start`

# Configuración InfluxDB con Grafana

Primero accedemos a la base de datos de influx y creamos una base de datos llamada graphite y tambien un usuario con permisos de administrador para las proximas configuraciónes.

`root@influx:/ # influx`

`Connected to http://localhost:8086 version 1.8.0`

`InfluxDB shell version: 1.8.0`

` create database graphite`

` show databases`

`name: databases`

`name`

`_internal`

`graphite`

`CREATE USER admin WITH PASSWORD 'configured' WITH ALL PRIVILEGES`

Modificamos "/usr/local/etc", con los valores que mostramos a continuación

`[http]`

` Determines whether HTTP endpoint is enabled.`

`	enabled = true`

` The bind address used by the HTTP service.`

`	bind-address = "192.168.1.123:8086"`

` Determines whether user authentication is enabled over HTTP/HTTPS.`

`	auth-enabled = true`


`[[graphite]]`

` Determines whether the graphite endpoint is enabled.`

`	enabled = true`

`	database = "graphitedb"`

`	retention-policy = ""`

`	bind-address = ":2003"`

`	protocol = "tcp"`

`	consistency-level = "one"`

`templates = [`

` 		"*.app env.service.resource.measurement",`

` 		"servers.* .host.resource.measurement.field*",`

`	    Default template`

`	   "server.*",`

`]`
 
Por ultimos vamos  en la configuración del nas a "System --> Reporting" y ahi nos saldran las opciones, para mandar la información al influx, marcamos las 2 casillas y en "Remote Graphite Server Hostname" ponemos la ip de la jail, el resto lo dejamos por defecto, por ultimo le damos a "Save"

![image](https://user-images.githubusercontent.com/91557849/170896007-d7e416cf-1991-4508-b2fb-880ede1d537e.png)

# Configuración Grafana

Accedemos a la web de grafana a traves del puerto 3000

![image](https://user-images.githubusercontent.com/91557849/170896052-d0f7a048-e786-4520-bb33-229a36796930.png)

Y añadimos la base de datos creada anteriormente en influxdb, como se ve en la imagen, utilizando el usuario previamente creado como administrador

![image](https://user-images.githubusercontent.com/91557849/170896082-7863f9a8-1747-4d13-8fae-3a74d75de361.png)

Tambien tenemos que poner el nombre de la base de datos creada "Graphite", una vez hecho todo le damos a "Save & Test"

![image](https://user-images.githubusercontent.com/91555281/172216801-66396354-cb9d-45f9-98d5-a42692307bf4.png)

Ahora buscamos el dashboard de grafana que vamos a utilizar, en nuestro caso el "12921"

![image](https://user-images.githubusercontent.com/91557849/170896473-c7f48da0-b83b-42b2-b617-85541fffa096.png)

Al tener ya escogido nuestro dashboard, lo importamos, selecionando la base de datos que hemos añadido al grafana.

![image](https://user-images.githubusercontent.com/91557849/170896495-63dbeaea-d302-4356-b892-a6effe59e906.png)

Una vez realizado todo, podemos ver que ya nos muestra todos los graficos con sus datos.

![image](https://user-images.githubusercontent.com/91557849/170896514-14db13ff-10b2-4729-9427-fa6e39de610a.png)


 
