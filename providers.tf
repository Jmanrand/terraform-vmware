provider "vsphere" {
  user                 = "administrator@vsphere.local"
  password             = "${var.vsphere_pass}"
  vsphere_server       = "192.168.1.253"
  allow_unverified_ssl = true
}

provider "aws" {
  region = "us-east-2"
  profile = "jrand"
}