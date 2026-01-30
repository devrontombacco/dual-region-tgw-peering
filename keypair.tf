resource "aws_key_pair" "ireland_key" {
  provider   = aws.ireland
  key_name   = "my_aws_key"
  public_key = file("~/.ssh/my_aws_key.pub")

  tags = {
    Name = "Ireland EC2 Keypair"
  }
}

resource "aws_key_pair" "london_key" {
  provider   = aws.london
  key_name   = "my_aws_key"
  public_key = file("~/.ssh/my_aws_key.pub")

  tags = {
    Name = "London EC2 Keypair"
  }
}
