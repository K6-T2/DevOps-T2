# MICROSERVICIO DE PAGOS QA

El desarrollo de este proyecto se ubica en el marco del Bootcamp **"Academia Devops"** desarrollado y supervisado por **Alkemy** para la empresa **Softtek**.

Esta rama esta se encarga de montar en una EC-2 de AWS para un entorno QA y correrle un contenedor Docker. Forma parte del Sprint 2 del proyecto **"Caso de Negocio"** el cual tenia 2 consignas.

<br>

**Consigna 1: Generar la IAC**

**[Consigna para IAC QA.txt](./Consigna%20Generar%20IAC%20QA.txt)**

Esta consigna propone: 
  
 + Configurar las credenciales Access key y Secret Key AWS en shell y lanzar una EC2 en base a un archivo main.tf
 + Generar un archivo Personal Access Token para el acceso ala EC-2 por SSH. Guardar la clave en un secret de Github Actions.
 + El archivo Main tiene las siguientes caracteristicas:

      + Crea un security group modificandole las politicas de ingreso y egreso. 
      + Lanza una EC-2. A esta se le asigna la el par de claves default "vockey" y el grupo de seguridad creado.
      + Devuelve un output que devuelva la IP publica para ser usada posteriormente.    
 
 + Por ultimo, Crear un workflow Acceder a la EC-2 desde Github Actionsmediante ssh y crear un directorio
<br>
<br>


**Consigna 2: Generar Pipeline CI**

**[Consigna Pipeline CI QA.txt](./Consigna%20Pipeline%20CI%20QA.txt)**


En consecuencia con la consigna 1, la consigna 2 propone:

Acceder a la EC-2 creada por SSH desde Github Actions
Instalarle paquetes: Nodejs, Npm, Git
Crear un Working Directory "/opt/nombreDeSuDirectorio"
Clonar el repositorio base brindado por Alkemy Repositorio base
Instalar paquetes NPM Express y PM2
Iniciar el servicio en NODE con PM2 Start
Verificar que la aplicacion este corriendo mediante curl, ns o pm2
