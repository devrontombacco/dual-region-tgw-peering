resource "aws_route_table" "vpc1-rt" {
  vpc_id   = aws_vpc.vpc1_ireland.id
  provider = aws.ireland

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
  vpc_id   = aws_vpc.vpc2_ireland.id
  provider = aws.ireland

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
  vpc_id   = aws_vpc.vpc3_ireland.id
  provider = aws.ireland

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
  vpc_id   = aws_vpc.vpc4_london.id
  provider = aws.london

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
  vpc_id   = aws_vpc.vpc5_london.id
  provider = aws.london

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


resource "aws_route_table_association" "vpc1_subnet_association" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.vpc1-rt.id
}

resource "aws_route_table_association" "vpc2_subnet_association" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.vpc2-rt.id
}

resource "aws_route_table_association" "vpc3_subnet_association" {
  subnet_id      = aws_subnet.private_subnet_3.id
  route_table_id = aws_route_table.vpc3-rt.id
}

resource "aws_route_table_association" "vpc4_subnet_association" {
  subnet_id      = aws_subnet.public_subnet_4.id
  route_table_id = aws_route_table.vpc4-rt.id
}

resource "aws_route_table_association" "vpc5_subnet_association" {
  subnet_id      = aws_subnet.public_subnet_5.id
  route_table_id = aws_route_table.vpc5-rt.id
}
