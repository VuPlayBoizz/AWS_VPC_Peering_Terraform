locals {
    base_tags = {
        Environment: var.environment
        Owner: var.owner 
    }
    vpc_a_tags = merge(local.base_tags,{Name: "vpc_a"})
    vpc_b_tags = merge(local.base_tags,{Name: "vpc_b"})    
}
module "vpc_a" {
    source                  = "./Modules/aws_vpc"
    cidr_block              = var.cidr_block[0]
    enable_dns_hostnames    = var.enable_dns_hostnames
    enable_dns_support      = var.enable_dns_support
    tags                    = local.vpc_a_tags

}
module "vpc_b" {
    source                  = "./Modules/aws_vpc"
    cidr_block              = var.cidr_block[1]
    enable_dns_hostnames    = var.enable_dns_hostnames
    enable_dns_support      = var.enable_dns_support
    tags                    = local.vpc_b_tags
}
module "subnet_vpc_a" {
    source              = "./Modules/aws_networking"
    vpc_id              = module.vpc_a.vpc_id
    public_cidr_block   = var.public_cidr_block[0]
    private_cidr_block  = var.private_cidr_block[0]
    availability_zone   = var.availability_zone
    tags                = merge(local.vpc_a_tags, {Name:"vpc_a"})
}
module "subnet_vpc_b" {
    source              = "./Modules/aws_networking"
    vpc_id              = module.vpc_b.vpc_id
    public_cidr_block   = var.public_cidr_block[1]
    private_cidr_block  = var.private_cidr_block[1]
    availability_zone   = var.availability_zone
    tags                = local.vpc_b_tags
}
module "sg_vpc_a" {
    source  = "./Modules/aws_security_group"
    vpc_id  = module.vpc_a.vpc_id
    MyIP    = var.MyIP
    myVPC   = var.myVPC[0]
    tags    =  local.vpc_a_tags 
}
module "sg_vpc_b" {
    source  = "./Modules/aws_security_group"
    vpc_id  = module.vpc_b.vpc_id
    MyIP    = var.MyIP
    myVPC   = var.myVPC[1]
    tags    = local.vpc_b_tags
}
module "private_key_vpc_a" {
    source = "./Modules/aws_key_pair"
    key_name = var.key_name[0]
}
module "private_key_vpc_b" {
    source = "./Modules/aws_key_pair"
    key_name = var.key_name[1]
}
module "public_ec2_vpc_a" {
    source = "./Modules/aws_ec2"
    instance_type = var.instance_type
    subnet_id = module.subnet_vpc_a.public_subnet_id
    key_name = module.private_key_vpc_a.key_name
    associate_public_ip_address = var.associate_public_ip_address[0]
    security_groups_ids = [module.sg_vpc_a.public_sg_id]
    tags = merge(local.vpc_a_tags, {Name: "public-ec2"})
}
module "private_ec2_vpc_b" {
    source = "./Modules/aws_ec2"
    instance_type = var.instance_type
    subnet_id = module.subnet_vpc_b.private_subnet_id
    key_name = module.private_key_vpc_b.key_name
    associate_public_ip_address = var.associate_public_ip_address[1]
    security_groups_ids = [module.sg_vpc_b.private_sg_id]
    tags = merge(local.vpc_a_tags, {Name: "private-ec2"})
}
module "vpc_peering" {
    source = "./Modules/aws_peering"
    vpc_a_id = module.vpc_a.vpc_id
    vpc_b_id = module.vpc_b.vpc_id
    vpc_a_rtb_id = module.subnet_vpc_a.public_rtb_id
    vpc_b_rtb_id = module.subnet_vpc_b.private_rtb_id
    vpc_a_cidr_block = var.cidr_block[0]
    vpc_b_cidr_block = var.cidr_block[1]
    tags = merge(local.base_tags, {
        Name = "vpc-a-to-vpc-b-peering"
    })
}






