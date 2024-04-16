# MICROSERVICIO DE PAGOS_DEV

El desarrollo de esta rama se ubica en el marco del Bootcamp **"Academia Devops"** ejecutado por **Alkemy** para la empresa **Softtek**.

Esta rama esta se encarga de desplegar una app desarrollada Node.Js en una EC-2 de AWS para un entorno DEV.

Forma parte del Sprint 1 del proyecto **"Caso de Negocio"** el cual tenia 2 consignas principales:

Consigna 1: Generar la IAC para el posterior despliege de la app.

Esta consigna propone:

  + Configurar las credenciales AWS en shell y lanzar una EC2 en base a un archivo main.tf
  + El archivo Main debe crear 2 recursos. Una EC2 y un security group al cual sera asignada
  + Modificar las politicas de ingreso y egreso de puertos del grupo de seguridad
  + Crear un output que devuelva la IP publica para ser usada posteriormente.
  + A la EC-2 se le asigna el par de claves default vockey
  + Acceder a la EC-2 desde Github mediante ssh y crear un directorio
  + Guardar la clave del archivo .PEM en un secret de github actions
[Consigna para IAC.txt](./Consigna%20Generar%20IAC.txt)

