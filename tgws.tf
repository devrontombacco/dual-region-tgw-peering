resource "aws_ec2_transit_gateway" "tgw_ireland" {
  description     = "main-tgw"
  amazon_side_asn = 64512

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

  auto_accept_shared_attachments  = "disable"
  default_route_table_association = "enable"
  default_route_table_propagation = "enable"
  dns_support                     = "enable"

  tags = {
    Name = "tgw_london"
  }
}
