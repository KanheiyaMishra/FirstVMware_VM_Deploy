variable "vsphere_datacenter" {
  default = "Indy"
}

variable "vsphere_datastore" {
  default = "IND_LINUX_CUS_NIM07_AF60_05"
}

variable "vsphere_compute_cluster" {
  default = "LINUX-CUS"
}

variable "vsphere_template" {
  default = "Cent_OS_7X_Template"
}

variable "folder" {
  default = "TBD_Kiran"
}

variable "aci_vm1_name" {
  default = "Kanheiya"
}

variable "VM_Network"{
    default = "Dv_VLAN_704"
}

variable "aci_vm1_address" {
  default = "10.74.4.194"
}

variable "gateway" {
  default = "10.74.4.1"
}
variable "dns_list" {
  default = ["10.74.95.32","10.74.95.51"]
}

variable "dns_search" {
  default = ["noam.fadv.net","apac.fadv.net","scrn.fadv.net","fadv.net"]
}

variable "domain_name" {
  default = "noam.fadv.net"
}

variable "VM_Spec_Scripts" {
    default = "E:/Terraform/scripts/IndyLinuxCustweb.txt"
}
