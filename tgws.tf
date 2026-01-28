resource "aws_ec2_transit_gateway" "tgw_ireland" {
  description     = "main-tgw"
  amazon_side_asn = 64512
  provider        = aws.ireland

  auto_accept_shared_attachments  = "disable"
  default_route_table_association = "enable"
  default_route_table_propagation = "enable"
  dns_support                     = "enable"

  tags = {
    Name = "tgw_ireland"
  }
}

resource "aws_ec2_transit_gateway" "tgw_london" {
  description     = "main-tgw"
  amazon_side_asn = 64513
  provider        = aws.london

  auto_accept_shared_attachments  = "disable"
  default_route_table_association = "enable"
  default_route_table_propagation = "enable"
  dns_support                     = "enable"

  tags = {
    Name = "tgw_london"
  }
}

# tgw attachments 
resource "aws_ec2_transit_gateway_vpc_attachment" "tgw1_vpc1" {
  transit_gateway_id = aws_ec2_transit_gateway.tgw_ireland.id
  vpc_id             = aws_vpc.vpc1_ireland.id
  subnet_ids         = [aws_subnet.public_subnet_1.id]
  dns_support        = "enable"

  tags = {
    Name = "tgw-attachment-vpc1-ireland"
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "tgw1_vpc2" {
  transit_gateway_id = aws_ec2_transit_gateway.tgw_ireland.id
  vpc_id             = aws_vpc.vpc2_ireland.id
  subnet_ids         = [aws_subnet.public_subnet_2.id]
  dns_support        = "enable"

  tags = {
    Name = "tgw-attachment-vpc2-ireland"
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "tgw1_vpc3" {
  transit_gateway_id = aws_ec2_transit_gateway.tgw_ireland.id
  vpc_id             = aws_vpc.vpc3_ireland.id
  subnet_ids         = [aws_subnet.private_subnet_3.id]
  dns_support        = "enable"

  tags = {
    Name = "tgw-attachment-vpc3-ireland"
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "tgw2_vpc4" {
  transit_gateway_id = aws_ec2_transit_gateway.tgw_london.id
  vpc_id             = aws_vpc.vpc4_london.id
  subnet_ids         = [aws_subnet.public_subnet_4.id]
  dns_support        = "enable"

  tags = {
    Name = "tgw-attachment-vpc4-london"
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "tgw2_vpc5" {
  transit_gateway_id = aws_ec2_transit_gateway.tgw_london.id
  vpc_id             = aws_vpc.vpc5_london.id
  subnet_ids         = [aws_subnet.public_subnet_5.id]
  dns_support        = "enable"

  tags = {
    Name = "tgw-attachment-vpc5-london"
  }
}
