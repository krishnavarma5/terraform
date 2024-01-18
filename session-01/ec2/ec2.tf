resource "aws_instance" "web" {
  ami           = "ami-0f3c7d07486cad139" #devops-practice
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.roboshop-all.id] #this means list

  tags = {
    Name = "Helloterraform"
  }
}

resource "aws_security_group" "roboshop-all" { #this is terraform name,for terraform reference only
    name        = var.sg-name #this is aws name
    description = var.sg-description
    #vpc_id      = aws_vpc.main.id
    

    ingress {
        description = "Allow All ports"
        from_port   = var.inbound-from-port #0 means all # 0 means all ports
        to_port     = 0 #0 means all
        protocol    = "tcp"
        cidr_blocks = var.cidr_blocks #cidr internet reference is 0.0.0.0
    }

     egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "roboshop-all-aws"
  }

}    