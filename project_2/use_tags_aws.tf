provider "aws" {
  access_key = "aws_access_key_victor"
  secret_key = "12344paswor123z"
  region     = "eu-central-1"
}

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
