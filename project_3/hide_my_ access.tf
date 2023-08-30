provider "aws" {}

resource "aws_instance" "My_Ubuntu" {
  count         = "3"
  ami           = "ami-03f38e546e3dc59e1"
  instance_type = "t2.micro"
  tags = {
    Name    = "My Ubuntu Server"
    Owner   = "Victor Bourman"
    Project = "Terraform Lessons"

  }

}

resource "aws_instance" "My_Amazon" {
  ami           = "ami-03a71cec707bfc3d7"
  instance_type = "t3.small"
  tags = {
    Name    = "My Amazon Server"
    Owner   = "Victor Bourman"
    Project = "Terraform Lessons"

  }

}
# Remove my Credenitals from provider "aws"
# Create a Notepad on my local computer with my Credenitals to AWS account
# Befor i run the command "terraform init" i will run this 3 commands
# Commands on cmd/terminal : 
# export AWS_ACCESS_KEY_ID=VICTOR-ACCESS-KEY123
# export AWS_SECRET_ACCESS_KEY=12345victor12345secret-access
# export AWS_DEFAULT_REGION=eu-central-1 
# and then run the command ---> terraform init . 

