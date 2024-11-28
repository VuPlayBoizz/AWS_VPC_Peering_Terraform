environment = "dev"
owner = "vuba"
region = "ap-southeast-1"
cidr_block = [ "10.0.0.0/16", "172.0.0.0/16" ]
enable_dns_hostnames = true
enable_dns_support = true
public_cidr_block = [ "10.0.1.0/24", "172.0.1.0/24" ]
private_cidr_block = [ "10.0.4.0/24", "172.0.4.0/24" ]
availability_zone = "ap-southeast-1a"
MyIP = "42.114.38.228/32"
myVPC = [ "10.0.0.0/16", "172.0.0.0/16" ]
key_name = [ "public_ec2", "private_ec2" ]
instance_type = "t2.micro"
associate_public_ip_address = [ "true", "false" ]