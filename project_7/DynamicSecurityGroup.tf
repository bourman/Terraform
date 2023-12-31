#--------------------------------------
# My Terraform                        -
# Add many ports with dynamic ingress -
# Made by Victor Bourman              -
#--------------------------------------
provider "aws" {
  region = "eu-east-2"
}
resource "aws_security_group" "My_Dynamic_Security_Group" {
  name = "Dynamic Security Group"

  dynamic "ingress" {
    for_each = ["80", "433", "8080", "1541", "9092"]
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
    # for VPC (SSH)
    ingress {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["10.10.0.0/16"]
    }
  }
  egress = {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name  = "Dynamic Security Group"
    Owner = "Victor Bourman"
  }
}
