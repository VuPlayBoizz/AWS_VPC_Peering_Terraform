### VPC
variable "environment" {
    type = string
}
variable "owner" {
    type = string
}
variable "region" {
    type = string
}
variable "cidr_block" {
    type = list(string)
}
variable "enable_dns_hostnames" {
    type = bool
}
variable "enable_dns_support" {
    type = bool
}

### Networking
variable "public_cidr_block" {
    type = list(string)
}
variable "private_cidr_block" {
    type = list(string)
}
variable "availability_zone" {
    type = string
}
### Security Group
variable "MyIP" {
    type = string
}
variable "myVPC" {
    type = list(string)
}
### Key Pair
variable "key_name" {
    type = list(string)
}
### EC2
variable "instance_type" {
    type = string
}
variable "associate_public_ip_address" {
    type = list(string)
}
