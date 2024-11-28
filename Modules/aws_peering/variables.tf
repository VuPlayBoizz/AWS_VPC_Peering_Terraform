variable "vpc_a_id" {
    type = string
}
variable "vpc_b_id" {
    type = string
}
variable "vpc_a_rtb_id" {
    type = string
}
variable "vpc_b_cidr_block" {
    type = string
}
variable "vpc_b_rtb_id" {
    type = string
}
variable "vpc_a_cidr_block" {
    type = string
}
variable "tags" {
    type = map(string)
}