variable "auth_url" {}
variable "tenant_name" {}
variable "user_name" {}
variable "password" {
  sensitive = true
}
variable "region" {
  default = "RegionOne"
}
variable "instance_name" {}
variable "flavor" {}
variable "image" {}
variable "network" {}
variable "sec_group" {
  default = "default"
}
variable "keypair" {}
