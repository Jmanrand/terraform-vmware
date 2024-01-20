resource "vsphere_virtual_machine" "ubuntu" {
  name             = "ubuntu-1"
  resource_pool_id = vsphere_compute_cluster.compute_cluster.resource_pool_id
  datastore_id     = data.vsphere_datastore.datastore_large.id
  num_cpus         = 2
  memory           = 16192
  guest_id         = data.vsphere_virtual_machine.ubuntu_template.guest_id
  scsi_type        = data.vsphere_virtual_machine.ubuntu_template.scsi_type
  network_interface {
    network_id   = data.vsphere_network.network.id
    adapter_type = data.vsphere_virtual_machine.ubuntu_template.network_interface_types[0]
  }
  disk {
    label            = "disk0"
    size             = data.vsphere_virtual_machine.ubuntu_template.disks.0.size
    thin_provisioned = data.vsphere_virtual_machine.ubuntu_template.disks.0.thin_provisioned
  }
  clone {
    template_uuid = data.vsphere_virtual_machine.ubuntu_template.id
    customize {
      linux_options {
        host_name = "ubuntu-1"
        domain    = "vsphere.local"
      }
      network_interface {}
    }
  }
}