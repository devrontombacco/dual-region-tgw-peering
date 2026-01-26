resource "aws_vpc" "vpc1_ireland" {
  provider   = aws.ireland
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "vpc1-eu-west-1"
  }
}

resource "aws_vpc" "vpc2_ireland" {
  provider   = aws.ireland
  cidr_block = "10.1.0.0/16"

  tags = {
    Name = "vpc2-eu-west-1"
  }
}

resource "aws_vpc" "vpc3_ireland" {
  provider   = aws.ireland
  cidr_block = "10.2.0.0/16"

  tags = {
    Name = "vpc3-eu-west-1"
  }
}

resource "aws_vpc" "vpc4_london" {
  provider   = aws.london
  cidr_block = "10.100.0.0/16"

  tags = {
    Name = "vpc4-eu-west-2"
  }
}

resource "aws_vpc" "vpc5_london" {
  provider   = aws.london
  cidr_block = "10.101.0.0/16"

  tags = {
    Name = "vpc5-eu-west-2"
  }
}
