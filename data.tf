variable "vsphere_server" {
  default =  "noamind01vcx02.noam.fadv.net"
}

variable "vsphere_user" {
  default = "administrator@vsphere.local"
}

variable "vsphere_password" {
  default = "F@dv#123"
}

data "vsphere_datacenter" "dc" {
  name = "Indy"
}

data "vsphere_datastore" "datastore" {
  name          = "IND_LINUX_CUS_NIM07_AF60_05"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_compute_cluster" "cluster" {
  name          = "LINUX-CUS"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "network" {
  name          = "Dv_VLAN_704"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_virtual_machine" "template" {
  name          = "OEL_8X_Template"
  datacenter_id = data.vsphere_datacenter.dc.id
}
