resource "aws_route_table" "vpc1-rt" {
  vpc_id = aws_vpc.vpc1_ireland.id

  #Route to internet
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw1_ireland.id
  }

  # Every other internal route
  #   route {
  #     cidr_block         = "10.0.0.0/8"
  #     transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  #   }

  tags = {
    Name = "vpc1-rt"
  }
}
