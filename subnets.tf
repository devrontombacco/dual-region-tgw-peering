resource "aws_subnet" "public_subnet_1" {
  vpc_id                  = aws_vpc.vpc1_ireland.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "eu-west-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "public_subnet_1"
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id                  = aws_vpc.vpc2_ireland.id
  cidr_block              = "10.1.1.0/24"
  availability_zone       = "eu-west-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "public_subnet_2"
  }
}

resource "aws_subnet" "private_subnet_3" {
  vpc_id                  = aws_vpc.vpc3_ireland.id
  cidr_block              = "10.2.1.0/24"
  availability_zone       = "eu-west-1a"
  map_public_ip_on_launch = false
  tags = {
    Name = "private_subnet_3"
  }
}

resource "aws_subnet" "public_subnet_4" {
  vpc_id                  = aws_vpc.vpc4_london.id
  cidr_block              = "10.100.1.0/24"
  availability_zone       = "eu-west-2a"
  map_public_ip_on_launch = true
  tags = {
    Name = "public_subnet_4"
  }
}

resource "aws_subnet" "public_subnet_5" {
  vpc_id                  = aws_vpc.vpc5_london.id
  cidr_block              = "10.101.1.0/24"
  availability_zone       = "eu-west-2a"
  map_public_ip_on_launch = true
  tags = {
    Name = "public_subnet_5"
  }
}
