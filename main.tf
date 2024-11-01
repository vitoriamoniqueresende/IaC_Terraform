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

# Grupo de segurança para o ALB
resource "aws_security_group" "alb_sg" {
  name        = "alb_security_group"
  description = "Grupo de segurança Application Load Balancer"



# Criar o Application Load Balancer
resource "aws_lb" "app_lb_sprint4" {
  name               = "app_lb_sprint4"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = [subnet-01d57d465162e6c0c]  


  tags = {
    Name = "MyAppLoadBalancerSprint4"
  }
}

# Listener para comtrolar o tráfego
resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.app_lb.arn
  port              = 80
  protocol          = "HTTP"

}

