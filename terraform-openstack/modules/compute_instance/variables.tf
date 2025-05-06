variable "name" {}
variable "image_name" {}
variable "flavor_name" {}
variable "key_pair" {}
variable "security_groups" {
  type = list(string)
}
variable "network_name" {}

variable "floating_ip_pool" {
  description = "The external network pool for floating IPs"
  type        = string
}
