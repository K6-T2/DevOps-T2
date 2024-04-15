variable "aws_access_key" {}
variable "aws_secret_key" {}

provider "aws" {
    region = "us-east-2" # Cambia esto a la regi¾n deseada
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
    }

data "aws_security_group" "existing" {
  name = "instance_security_group"
}

resource "aws_security_group" "instance_security_group" {

count = data.aws_security_group.existing.id == null ? 1 : 0

name = "instance_security_group"
description = "Security group for EC2 instance"
    
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
from_port = 3000
to_port = 3000
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
}

egress {
from_port = 22
to_port = 22
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
}

egress {
from_port = 443
to_port = 443
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
}

egress {
from_port = 3000
to_port = 3000
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
}

ingress {
  from_port = 80
  to_port = 80
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}

}



resource "aws_instance" "Pagos_qa_instance" {
    ami = "ami-019f9b3318b7155c5" # AMI de Amazon Linux
    instance_type = "t2.micro" # Tipo de instancia
    key_name = "vockey" # Nombre de tu key pair existente en AWS
    
    vpc_security_group_ids =  vpc_security_group_ids = vpc_security_group_ids = data.aws_security_group.existing != null ? [data.aws_security_group.existing.id] : [aws_security_group.instance_security_group.id]
     
        tags = {
    Name = "ORG-PAGOS-QA" #Reemplazar por el nombre correcto
    }

    }
        output "instance_ip_Pagos_qa" {
    value = aws_instance. Pagos_qa_instance.public_ip
    }

