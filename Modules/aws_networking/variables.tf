variable "public_cidr_block" {
    type = string
}
variable "private_cidr_block" {
    type = string
}
variable "availability_zone" {
    type = string
}
variable "vpc_id" {
    type = string
}
variable "tags" {
    type = map(string)
    description = "Tags to assign to the VPC"
}