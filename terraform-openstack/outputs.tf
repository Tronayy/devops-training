output "vm_ips" {
  value = {
    for k, v in module.devops_vms :
    k => v.floating_ip
  }
}
