variable "name" {}
variable "image_name" {}
variable "flavor_name" {}
variable "key_pair" {}
variable "security_groups" {
  type = list(string)
}
variable "network_name" {}
