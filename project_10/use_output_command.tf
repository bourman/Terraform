#--------------------------------------
# My Terraform                        -
# Build WebServer during Bootsrap     -
# Made by Victor Bourman              -
#--------------------------------------
provider "aws" {
  region = "eu-east-2"
}
resource "aws_eip" "My_static_ip" {
  instance = aws_instance.My_webserver.id
  #now it will first up the new server then down the previous server and now We will shorten our DOWNTIME
  #it will take the ip of the firest server and attached to the new server

}

resource "aws_instance" "My_webserver" {
  ami                    = "ami-0371cec707bfc3d7" #Amazon Linux AMI
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.My_webserver.id]
  user_data = templatefile("user_data.sh.tpl", {
    f_name = "Victor"
    l_name = "Bourman"
    names  = ["Vasya", "Kolya", "Petya", "john", "Donald", "Masha", "new_name"]
  })
  tags = {
    Name  = "Web Server Build by Terraform"
    Owner = "Victor Bourman"
  }
  lifecycle {
    create_before_destroy = true

  }
}
#first my Security Group will created, then the resource aws_instance will be created.
resource "aws_security_group" "My_webserver" {
  name        = "WebServer Security Group"
  description = "My first SecurityGroup"

  ingress = [
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port   = 433
      to_port     = 433
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
  egress = {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name  = "Web Server SecurityGroup"
    Owner = "Victor Bourman"
  }
}
output "webserver_instance_id" {
  value = aws_instance.My_webserver.id
}
output "webserver_public_ip_address" {
  value = aws_eip.My_static_ip
}
