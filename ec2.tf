# Create a security group
resource "aws_security_group" "main_instance_sg" {
  name_prefix = "instance-sg"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create an EC2 instance
resource "aws_instance" "main_instance" {
  ami           = "ami-00bb6a80f01f03502" # Amazon Linux 2 AMI (update as needed)
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.private.id
  key_name      = "softradixad"
  security_groups = [aws_security_group.main_instance_sg.name]
  root_block_device {
    volume_size = 10
    volume_type = "gp3"
    delete_on_termination = true
  }
  tags = {
    Name = "Main Instance"
  }
}
