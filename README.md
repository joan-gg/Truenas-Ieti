<p align="center">
<img src="https://user-images.githubusercontent.com/91557892/170297046-c4932ee1-1ceb-4271-9161-93ebdc935b55.png" />
</p>
Proyecto realizado por: Alex Valero, Santi Balboa & Joan Garcia

## Introducción

El objetivo del proyecto es crear un servidor NAS Local al cual acceder a través de una VPN privada mediante OpenVPN.
El NAS tendrá la interfaz de WebCloud para de esta manera hacer más intuitivo y facil el poder subir archivos, tambíen ofrecemos diferentes servicios como un servidor multimedia en el cual los usuarios podrán almacenar sus propias peliculas/series/etc y de esta forma que el NAS no solo sirva de almacenamiento sino que también permita la propia visualización de los archivos, ademas los usuarios podrán almacenar las copias de seguridad de su propios equipos y realizar restauraciónes en todo momento mas se podrá acceder a los diferentes servicios mediante subdominios de ietinas.tk.

Todo esto estará monitorizado con InfluxDB y Grafana, además para una mayor seguridad, hemos añadido alertas que nos avisan en caso de caida, un uso elevado de la RAM/CPU/etc e incluso del uso de los discos duros.

Los plug-ins utilizados para ofrecer los diferentes servicios son los siguientes:

NextCloud: El cual como dice arriba solo utilizaremos como interfáz gráfica.

Plex: Servidor multimeda para permitir almacenar archivos de video y poderlos reproducir en cualquier momento.

Además el servidor NAS tendrá una parte con SAMBA para poder añadir contenido a través de carpetas compartidas y un servidor en la nube para almacenar copias de seguridad tanto de las carpetas compartidas en SAMBA como del propio servidor.

## Enlaces a paginas WEB

1. TrueNAS: https://nas.ietinas.tk
2. Nextcloud: https://nc.ietinas.tk
3. Plex_Server: https://plex.ietinas.tk
4. Influx (Grafana): http://monitor.ietinas.tk:3000
5. BackBlaze: https://www.backblaze.com/

## Config OpenVPN

- Red: 10.8.0.0/8
- SSL: Yes
- Tunnel: Yes
- Port: 1194 (Default)
- tls-crypt: Yes
- dh: none

## Politicas de backups

**Tipos de copias de seguridad**

Diferencial: se copian los datos que han cambiado desde la última copia
completa (Backup de SAMBA).

Completa: Se copian todos los datos de un soporte (Backup del NAS).

**Horario de realización del backup**

Cada día a las 00:00 se realizará una copia de seguridad de toda la unidad compartida de SAMBA y la información almacenada de los usuarios y se subirá a Backblaze.

Cada semana a las 00:00 se realizará una copia de seguridad de todo el NAS y se subirá a Backblaze.

**Caducidad de los backups**

Las copias de seguridad de SAMBA y información de usuarios, tendrán una validez de 1 semana, después de ese tiempo, estas serán eliminadas de la nube.

Las copias de seguridad del NAS, tendrán una validez de 1 mes, después de ese tiempo, estas serán eliminadas de la nube.

**Seguridad**

Las copias de seguridad serán revisadas para :

Comprobar y corregir errores.

Optimizar el rendimiento de copia de seguridad cuando sea posible.

Identificar problemas y tomar medidas correctivas para reducir los riesgos asociados con copias de seguridad fallidas.

**Optimización de espacio**

Una vez revisadas las copias de seguridad, en caso de que varias de ellas tengan la misma información, la más antigua será eliminada manualmente de la nube para optimizar el espacio.

**Restauración de los backups**

Comprobar que las copias están bien realizadas y que pueden restaurarse: 

Fijaremos una periodicidad para realizar pruebas de restauración para garantizar que la información necesaria para la prosperidad de la empresa es recuperable en caso de desastre.


## NextCloud

Hemos utilizado NextCloud para que los usuarios que utilizan nuestros servicios tengan una interficie gráfica mas amigable e intuitiva para poder subir los archivos deseados al NAS, no como nube.

**Restricciones de Tamaños**

Los usuarios tienen un límite de tamaño para subir archivos, ya que si no fuese así, tendríamos el NAS lleno en 1 día, según el tipo de servicio, unos usuarios tienen más tamaño disponible que otros, por ejemplo:

Con el plan Básico, los usuarios disponen de 5GB.

Con el plan Avanzado, los usuarios disponen de 10GB.

Y con el plan Pro, los usuarios disponen de 20GB

Y luego los Jefes tienen tamaño ilimitado.

## Plex

Desde TRUENAS-IETI ofrecemos un servicio de multimedia para que los usuarios que se conecten al NAS puedan subir libremente cualquier tipo de contenido multimedia (el cual no inflinja ninguna regla de nuestra política) el cual será accesible 24/7.

**Restricciones de usuarios**

Plex funciona mediante una carpeta compartida en SAMBA, los usuarios podrán conectarse a la carpeta compartida y subir el contenido que quieran, tanto peliculas como series, documentales, animes, etc...

Al ser un directorio compartido, este será vigilado por los administradores para que no se suba ningún contenido no apropiado


## Influx+Grafana

Tenemos un SIEM para monitorizar todos los logs / estados de todos nuestros servicios dentro del nas y así poder detectar los accesos no permitidos y errores, también para poder obtener una información más detallada sobre su funcionamiento y así poder detectar errores para un correcto funcionamiento de todos los servicios.

Mediante Grafana, hemos implementado un sistema de alertas que nos avisa por correo en caso de caida de algún servicio, un uso elevado de algún elemento así como RAM/CPU/etc y también en caso de que los discos se estén llenando.


## Backups de los clientes

Queremos ofrecer a nuestros clientes la mayor cantidad de contenido a poder almacenar posible, además de que queremos garantizar su seguridad, es por ello que ofrecemos un servicio de almacenamiento de copias de seguridad para nuestros clientes, los usuarios de Truenas-ieti, podrán almacenar los backups de sus ordenadores sin problema en nuestro servidor y realizar su restauración en todo momento, además estas copias serán accesibles 24/7 medante carpetas compartidas a las cuales solo los usuarios propietarios de cada carpeta tendrán acceso.
