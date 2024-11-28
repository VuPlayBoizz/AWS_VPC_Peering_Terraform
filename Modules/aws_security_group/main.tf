resource "aws_security_group" "public_sg" {
    vpc_id      = var.vpc_id
    description = "This is security group for public subnet"
    ingress {
        description = "Allow SSH from my computer IP"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = [var.MyIP]
    }
    ingress {
        description = "Allow HTTP from my computer IP"
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = [var.MyIP]
    }
    ingress {
        description = "Allow HTTPS from my computer IP"
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_blocks = [var.MyIP]
    }
    egress {
        description = "Allow all traffic from 0.0.0.0/0"
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = merge(var.tags, {Name: "public_sg"})   
}
resource "aws_security_group" "private_sg" {
    vpc_id      = var.vpc_id 
    description = "This is security group for private subnet"
    ingress {
        description = "Allow all traffic from VPC cidr block"
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = [var.myVPC]
    }
    egress {
        description = "Allow All traffic from 0.0.0.0/0"
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = merge(var.tags, {Name: "private_sg"})
}