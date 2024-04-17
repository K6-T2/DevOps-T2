# MICROSERVICIO DE AUDITORIA
El microservicio de auditoría es un componente del sistema que se encarga de registrar y almacenar información relevante sobre las acciones y eventos que ocurren dentro de una aplicación o sistema más grande. Su objetivo principal es proporcionar trazabilidad y transparencia en las operaciones realizadas, lo que puede ser crucial para el cumplimiento normativo, la resolución de problemas y la mejora del rendimiento del sistema.


Continuous Delivery Pipeline
Este pipeline de entrega continua automatiza el proceso de construcción, empaquetado, y despliegue de una aplicación en un entorno de producción.

Descripción del Pipeline
Este pipeline está diseñado para ser desencadenado manualmente mediante la interfaz de GitHub. Realiza los siguientes pasos:

Checkout del Código:
Utiliza la acción actions/checkout para clonar el repositorio en el agente de GitHub Actions.

Construir la Imagen Docker:
Ejecuta el comando docker build para construir la imagen Docker de la aplicación, etiquetada como mp1214/devopst2:latest.

Inicio de Sesión en DockerHub:
Utiliza el comando docker login para iniciar sesión en DockerHub utilizando las credenciales almacenadas como secretos en GitHub.

Subida a DockerHub:
Utiliza el comando docker push para subir la imagen Docker recién construida a DockerHub, bajo el nombre mp1214/devopst2:latest.
Despliegue al Entorno:

Se ejecuta un script de despliegue únicamente si el pipeline es desencadenado manualmente.
Aquí se debería incluir cualquier paso necesario para desplegar la aplicación en el entorno de producción.
Verificación del Servicio en Ejecución:

Se ejecuta un script de verificación únicamente si el pipeline es desencadenado manualmente.
Aquí se debería incluir cualquier lógica necesaria para verificar que la aplicación se está ejecutando correctamente en el entorno de producción.
Ejecución del Pipeline
Para ejecutar manualmente este pipeline, sigue estos pasos:

Ve a la pestaña "Actions" en tu repositorio de GitHub.
Selecciona el pipeline "Continuous Delivery Pipeline".
Haz clic en el botón "Run workflow" y selecciona la opción adecuada según tus necesidades.

