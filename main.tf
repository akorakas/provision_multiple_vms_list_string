resource "vsphere_virtual_machine" "vm" {
  for_each         = { for idx, name in var.vm_names : name => idx }
  name             = each.key
  datastore_id     = data.vsphere_datastore.datastore.id
  resource_pool_id = data.vsphere_resource_pool.pool.id
  folder           = var.vm_folder
  num_cpus         = var.vm_cpu
  memory           = var.vm_memory * 1024
  guest_id         = data.vsphere_virtual_machine.template.guest_id
  scsi_type        = data.vsphere_virtual_machine.template.scsi_type
  firmware         = data.vsphere_virtual_machine.template.firmware

  network_interface {
    network_id   = data.vsphere_network.network.id
    adapter_type = data.vsphere_virtual_machine.template.network_interface_types[0]
  }

  disk {
    label            = "disk0"
    size             = var.vm_disk_size
    thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
    customize {
      dynamic "windows_options" {
        for_each = var.os_type == "windows" ? [1] : []
        content {
          computer_name = each.key
        }
      }

      dynamic "linux_options" {
        for_each = var.os_type == "linux" ? [1] : []
        content {
          host_name = each.key
          domain    = var.vm_domain
        }
      }

      network_interface {
        ipv4_address = var.vm_ips[each.value]
        ipv4_netmask = "255.255.255.0"
      }
      ipv4_gateway    = "192.168.1.1"
      dns_server_list = var.vm_dns_list
      dns_suffix_list = var.vm_suffix_list
    }
  }
}
