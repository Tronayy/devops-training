variable "auth_url" {}
variable "tenant_name" {}
variable "user_name" {}
variable "password" {
  sensitive = true
}
variable "region" {
  default = "RegionOne"
}

variable "vm_definitions" {
  type = map(object({
    image_name      = string
    flavor_name     = string
    key_pair        = string
    security_groups = list(string)
    network_name    = string
  }))
}

variable "floating_ip_pool" {
  type        = string
  description = "External network pool used for floating IP allocation"
}
