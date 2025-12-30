resource "aws_security_group" "app_sg" {
  name   = "app-sg"
  vpc_id = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # nanti bisa restrict IP
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "app" {
  count         = 2
  ami           = "ami-ubuntu-22.04" # ganti sesuai region
  instance_type = "t3.micro"
  key_name      = var.key_name
  subnet_id     = element(var.subnet_ids, count.index)
  vpc_security_group_ids = [aws_security_group.app_sg.id]

  tags = {
    Name = "App-Server-${count.index+1}"
  }
}
