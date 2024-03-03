terraform {
  cloud {
    organization = "Learn_Terraform_Kanheiya"
    workspaces {
      name = "FirstVMware_VM_Deploy"
    }
  }
  required_providers {
    vsphere = {
      source = "hashicorp/vsphere"
      version = "2.6.1"
    }
  }
}
provider "vsphere" {
     
}
