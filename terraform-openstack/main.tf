terraform {
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.52.1"
    }
  }
}

provider "openstack" {
  auth_url    = var.auth_url
  tenant_name = var.tenant_name
  user_name   = var.user_name
  password    = var.password
  region      = var.region
}

module "devops_vm_1" {
  source          = "./modules/compute_instance"
  name            = "devops-vm-1"
  image_name      = "ubuntu-24-noble-server"
  flavor_name     = "m1.small"
  key_pair        = "tron"
  security_groups = ["all"]
  network_name    = "admin-private-net"
}
