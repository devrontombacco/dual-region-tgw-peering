resource "aws_internet_gateway" "igw_ireland" {
  vpc_id = aws_vpc.vpc2_ireland.id

  tags = {
    Name = "igw_ireland"
  }
}

resource "aws_internet_gateway" "igw1_london" {
  vpc_id = aws_vpc.vpc4_london.id

  tags = {
    Name = "igw1_london"
  }
}

resource "aws_internet_gateway" "igw2_london" {
  vpc_id = aws_vpc.vpc5_london.id

  tags = {
    Name = "igw2_london"
  }
}
