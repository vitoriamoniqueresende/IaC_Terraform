provider "aws" {
    region = "us-east-1"
 
}

module "ec2_instance"{
source="terraform-aws-modules/ec2-instance/aws"
name = "instancia_sprint4" 
 
ami = "ami-0866a3c8686eaeeba" 
instance_type = "c5.4xlarge" #Tipo de instancia escolhido no Sprint 3

 
tags={
    Terraform="true"
    Environment="dev"
    Autor = "Dolphin"
}


# Variáveis para a instância EC2
variable "instance_type" {
  default = "c5.4xlarge" 
}

variable "ami_id" {
  default = "ami-0866a3c8686eaeeba" # Peguei da aws para o tipo de instancia especificado
}
# Geração de ID aleatório
resource "random_id" "bucket_id" {
  byte_length = 8  # Define o comprimento do ID
}
# Bucket S3
resource "aws_s3_bucket" "bucket_sprint4" {
  bucket = "bucket_sprint4-${random_id.bucket_id.hex}"
  acl    = "public-read"  # Permitir leitura pública
}

  tags = {
    Name        = "bucket_sprint4"
    Environment = "Dev"
  }
}




  # Regras de entrada
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Permissão HTTP
  }

  # Regras de saída
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

