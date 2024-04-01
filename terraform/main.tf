# Configuración del proveedor AWS
provider "aws" {
  region = "us-east-1" # Cambia esto a la región deseada
}

# Crear un nuevo grupo de seguridad
resource "aws_security_group" "instance_security_group" {
  name        = "instance_security_group"
  description = "Security group for EC2 instance"
}

# Definición de la instancia EC2
resource "aws_instance" "VENTAS_dev_instance" {
  ami             = "ami-0a3c3a20c09d6f377" # AMI de Amazon Linux
  instance_type   = "t2.micro"             # Tipo de instancia
  key_name      = "key-caso-equipo2"   # Nombre del nuevo par de claves que deseas asociar

  # Asociar la instancia con el grupo de seguridad recién creado
  vpc_security_group_ids = [aws_security_group.instance_security_group.id]

  # Tag para identificar la instancia
  tags = {
    Name = "ORG-VENTAS-DEV" # Reemplazar por el nombre correcto
  }
}

# Salida para mostrar la IP pública de la instancia EC2 después del despliegue
output "public_ip_dev" {
  value = aws_instance.VENTAS_dev_instance.public_ip
}