# Declaración de variables
variable "aws_access_key" {
    type = string
    sensitive = true
    description = "AWS Access Key"
}

variable "aws_secret_key" {
    type = string
    sensitive = true
    description = "AWS Secret Key"
}

# Proveedor de AWS
provider "aws" {
    region = "us-east-1"
    access_key = var.aws_access_key
    secret_key = var.aws_secret_key
}

# Verificación de grupo de seguridad existente
data "aws_security_group" "existing_sg" {
    name = "instance_security_group_custom"
    vpc_id = "tu-vpc-id"  # Asegúrate de usar el ID correcto de tu VPC
}

# Recurso de grupo de seguridad
resource "aws_security_group" "instance_security_group_custom" {
    count = data.aws_security_group.existing_sg ? 0 : 1  # Crear solo si no existe

    name = "instance_security_group_custom"
    description = "Custom security group for EC2 instance"

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 3000
        to_port = 3000
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

# Recurso de instancia EC2
resource "aws_instance" "clientesqa_instance" {
    ami = "ami-0a3c3a20c09d6f377"  # AMI de Amazon Linux
    instance_type = "t2.micro"  # Tipo de instancia
    key_name = "clavepem"  # Nombre de tu clave de acceso existente en AWS

    # Asociar la instancia con el grupo de seguridad creado o existente
    # Aquí accedemos al primer (y único) recurso aws_security_group.instance_security_group_custom con índice 0
    vpc_security_group_ids = data.aws_security_group.existing_sg ? [
        data.aws_security_group.existing_sg.id
    ] : [
        aws_security_group.instance_security_group_custom[0].id
    ]

    # Etiquetas para identificar la instancia
    tags = {
        Name = "ORG-CLIENTES-QA"
    }
}
