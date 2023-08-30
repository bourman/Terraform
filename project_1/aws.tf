provider "aws" {
  access_key = "aws_access_key_victor"
  secret_key = "12344paswor123z"
  region     = "eu-central-1"

}

resource "aws_instance" "My_Ubuntu" {
  ami           = "ami-03f38e546e3dc59e1"
  instance_type = "t2.micro"

}
