resource "aws_internet_gateway" "igw1_ireland" {
  provider = aws.ireland
  vpc_id   = aws_vpc.vpc1_ireland.id

  tags = {
    Name = "igw1_ireland"
  }
}

resource "aws_internet_gateway" "igw2_ireland" {
  provider = aws.ireland
  vpc_id   = aws_vpc.vpc2_ireland.id

  tags = {
    Name = "igw2_ireland"
  }
}

resource "aws_internet_gateway" "igw4_london" {
  vpc_id   = aws_vpc.vpc4_london.id
  provider = aws.london
  tags = {
    Name = "igw4_london"
  }
}

resource "aws_internet_gateway" "igw5_london" {
  vpc_id   = aws_vpc.vpc5_london.id
  provider = aws.london

  tags = {
    Name = "igw5_london"
  }
}
