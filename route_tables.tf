resource "aws_route_table" "vpc1-rt" {
  vpc_id = aws_vpc.vpc1_ireland.id

  #Route to internet
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw_ireland.id
  }

  # Route to vpc via TGW
  route {
    cidr_block         = ""
    transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  }

  # Route to 
  route {
    cidr_block         = ""
    transit_gateway_id = 
  }

  # Route to 
  route {
    cidr_block         = ""
    transit_gateway_id = 
  }

  tags = {
    Name = "vpc1-rt"
  }
}