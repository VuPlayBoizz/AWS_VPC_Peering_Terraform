resource "aws_vpc_peering_connection" "vpc_peering" {
    vpc_id      = var.vpc_a_id
    peer_vpc_id = var.vpc_b_id
    auto_accept = true  # Set to true if you want to automatically accept the peering connection
  
    tags = merge(var.tags, {
      Name = "vpc-peering"
    })
}
resource "aws_route" "vpc_a_to_vpc_b" {
    route_table_id            = var.vpc_a_rtb_id
    destination_cidr_block    = var.vpc_b_cidr_block
    vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peering.id
}

resource "aws_route" "vpc_b_to_vpc_a" {
  route_table_id            = var.vpc_b_rtb_id
  destination_cidr_block    = var.vpc_a_cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peering.id
}

