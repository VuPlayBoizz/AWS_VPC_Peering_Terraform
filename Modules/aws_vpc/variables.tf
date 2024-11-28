variable "cidr_block" {
    type = string
}
variable "enable_dns_hostnames" {
    type = bool
}
variable "enable_dns_support" {
    type = bool
}
variable "tags" {
    type = map(string)
    description = "Tags to assign to the VPC"
}
