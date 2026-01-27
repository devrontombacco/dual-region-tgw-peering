resource "aws_route_table" "vpc1-rt" {
  vpc_id = aws_vpc.vpc1_ireland.id

  # Route to internet
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw1_ireland.id
  }

  # Every other internal route
  route {
    cidr_block         = "10.0.0.0/8"
    transit_gateway_id = aws_ec2_transit_gateway.tgw_ireland.id
  }

  tags = {
    Name = "vpc1-rt"
  }
}

resource "aws_route_table" "vpc2-rt" {
  vpc_id = aws_vpc.vpc2_ireland.id

  #Route to internet
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw2_ireland.id
  }

  # Every other internal route
  route {
    cidr_block         = "10.0.0.0/8"
    transit_gateway_id = aws_ec2_transit_gateway.tgw_ireland.id
  }


  tags = {
    Name = "vpc2-rt"
  }
}

resource "aws_route_table" "vpc3-rt" {
  vpc_id = aws_vpc.vpc3_ireland.id

  # Every other internal route
  route {
    cidr_block         = "10.0.0.0/8"
    transit_gateway_id = aws_ec2_transit_gateway.tgw_ireland.id
  }


  tags = {
    Name = "vpc3-rt"
  }
}


resource "aws_route_table" "vpc4-rt" {
  vpc_id = aws_vpc.vpc4_london.id

  #Route to internet
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw4_london.id
  }

  # Every other internal route
  route {
    cidr_block         = "10.0.0.0/8"
    transit_gateway_id = aws_ec2_transit_gateway.tgw_london.id
  }

  tags = {
    Name = "vpc4-rt"
  }
}

resource "aws_route_table" "vpc5-rt" {
  vpc_id = aws_vpc.vpc5_london.id

  #Route to internet
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw5_london.id
  }

  # Every other internal route
  route {
    cidr_block         = "10.0.0.0/8"
    transit_gateway_id = aws_ec2_transit_gateway.tgw_london.id
  }

  tags = {
    Name = "vpc5-rt"
  }
}
