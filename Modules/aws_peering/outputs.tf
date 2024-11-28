output "vpc_peering_connection_id" {
  value = aws_vpc_peering_connection.vpc_peering.id
  description = "ID of the VPC Peering connection"
}

output "vpc_a_to_vpc_b_route" {
  value = aws_route.vpc_a_to_vpc_b.id
  description = "Route from VPC A to VPC B"
}

output "vpc_b_to_vpc_a_route" {
  value = aws_route.vpc_b_to_vpc_a.id
  description = "Route from VPC B to VPC A"
}