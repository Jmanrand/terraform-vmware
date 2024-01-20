data "vsphere_datacenter" "datacenter" {
  name = "dc01"
}

resource "vsphere_compute_cluster" "compute_cluster" {
  name            = "cluster-01"
  datacenter_id   = data.vsphere_datacenter.datacenter.id
  host_system_ids = [data.vsphere_host.r630.id]
}

data "vsphere_resource_pool" "default" {
  name          = "${vsphere_compute_cluster.compute_cluster.name}/Resources/"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_host" "r630" {
  name          = "192.168.1.254"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_network" "network" {
  name          = "VM Network"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

resource "vsphere_content_library" "content_library" {
  name            = "Publisher Content Library"
  description     = "A publishing content library."
  storage_backing = [data.vsphere_datastore.datastore_large.id]
}

data "vsphere_virtual_machine" "ubuntu_template" {
  name          = "ubunutu-22.04.3-server"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}