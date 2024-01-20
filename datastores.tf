
data "vsphere_datastore" "datastore" {
  name          = "datastore002"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_datastore" "datastore_large" {
  name          = "datastore03"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}