variable "vsphere_pass" {
    sensitive = true
    type = string
    description = "vCenter password for administrator"
}