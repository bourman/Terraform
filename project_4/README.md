Process: first my Security Group will created, then the resource aws_instance will be created.
1) Use "vpc_security_group_ids = [aws_security_group.My_webserver.id]" I made security group will be connected to resource "aws_instance". 
2) Open port 80 , 433 .
3) Use EOF to run on the machine scripts for my webservice.
4) Use Tags for clear work.

