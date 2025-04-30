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

# Example Resource
resource "openstack_compute_instance_v2" "vm_1" {
  name            = var.instance_name
  image_name      = var.image
  flavor_name     = var.flavor
  key_pair        = var.keypair
  security_groups = [var.sec_group]
  network {
    name = var.network
  }
}
