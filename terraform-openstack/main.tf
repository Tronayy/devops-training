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

module "devops_vms" {
  source     = "./modules/compute_instance"
  for_each   = var.vm_definitions
  name            = each.key
  image_name      = each.value.image_name
  flavor_name     = each.value.flavor_name
  key_pair        = each.value.key_pair
  security_groups = each.value.security_groups
  network_name    = each.value.network_name
  floating_ip_pool = var.floating_ip_pool
}

resource "null_resource" "ssh_provision_vm" {
  for_each = module.devops_vms

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("~/tron.pem")
    host        = each.value.floating_ip
    timeout     = "2m"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update -y",
      "sudo apt install -y docker.io git",
      "sudo systemctl enable docker",
      "sudo systemctl start docker"
    ]
  }

  depends_on = [module.devops_vms]
}

