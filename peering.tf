# peering attachment from Ireland to London
resource "aws_ec2_transit_gateway_peering_attachment" "ireland_to_london" {
  provider = aws.ireland

  peer_region             = "eu-west-2"
  peer_transit_gateway_id = aws_ec2_transit_gateway.tgw_london.id
  transit_gateway_id      = aws_ec2_transit_gateway.tgw_ireland.id

  tags = {
    Name = "ireland-london-peering"
  }
}

# Accept the peering attachment from the London side
resource "aws_ec2_transit_gateway_peering_attachment_accepter" "london_accept" {
  provider = aws.london

  transit_gateway_attachment_id = aws_ec2_transit_gateway_peering_attachment.ireland_to_london.id

  tags = {
    Name = "london-accept-ireland-peering"
  }
}
