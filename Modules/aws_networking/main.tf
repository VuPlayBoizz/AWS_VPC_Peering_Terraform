resource "aws_subnet" "public_subnet" {
    vpc_id              = var.vpc_id
    cidr_block          = var.public_cidr_block
    availability_zone   = var.availability_zone
    tags              = merge(var.tags, {Subnet_Type = "Public"})
}
resource "aws_subnet" "private_subnet" {
    vpc_id              = var.vpc_id
    cidr_block          = var.private_cidr_block
    availability_zone   = var.availability_zone
    tags              = merge(var.tags, {Subnet_Type = "Private"})
}
resource "aws_internet_gateway" "igw" {
    vpc_id              = var.vpc_id
    tags   = merge(var.tags, {Name = "internet-gateway"})
}
resource "aws_route_table" "public_rtb" {
    vpc_id              = var.vpc_id
    route {
        cidr_block      = "0.0.0.0/0"
        gateway_id      = aws_internet_gateway.igw.id
    }
    tags = merge(var.tags, {Name = "public-rtb"})
}
resource "aws_route_table" "private_rtb" {
    vpc_id              = var.vpc_id
    tags = merge(var.tags, {Name = "private-rtb"})
}
resource "aws_route_table_association" "public_rtb_association" {
    subnet_id           = aws_subnet.public_subnet.id
    route_table_id      = aws_route_table.public_rtb.id
}
resource "aws_route_table_association" "private_rtb_association" {
    subnet_id           = aws_subnet.private_subnet.id
    route_table_id      = aws_route_table.private_rtb.id
}