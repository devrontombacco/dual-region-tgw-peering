data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}


resource "aws_instance" "ec2_1" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.public_subnet_1.id
  key_name                    = "MY_EC2_INSTANCE_KEYPAIR"
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.sg_nginx1.id]

  tags = {
    Name = "ec2_1"
  }
}

resource "aws_instance" "ec2_2" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.public_subnet_2.id
  key_name                    = "MY_EC2_INSTANCE_KEYPAIR"
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.sg_nginx2.id]

  tags = {
    Name = "ec2_2"
  }
}

resource "aws_instance" "ec2_3" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.private_subnet_3.id
  key_name                    = "MY_EC2_INSTANCE_KEYPAIR"
  associate_public_ip_address = false
  vpc_security_group_ids      = [aws_security_group.sg_flaskApp3.id]

  tags = {
    Name = "ec2_3"
  }
}

resource "aws_instance" "ec2_4" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.public_subnet_4.id
  key_name                    = "MY_EC2_INSTANCE_KEYPAIR"
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.sg_nginx4.id]

  tags = {
    Name = "ec2_4"
  }
}

resource "aws_instance" "ec2_5" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.public_subnet_5.id
  key_name                    = "MY_EC2_INSTANCE_KEYPAIR"
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.sg_nginx5.id]

  tags = {
    Name = "ec2_5"
  }
}
