resource "vsphere_virtual_machine" "this" {
  name             = "intftest01lvd"
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id     = data.vsphere_datastore.datastore.id

  num_cpus             = 4
  num_cores_per_socket = 2
  memory               = 4096
  guest_id             = data.vsphere_virtual_machine.template.guest_id
  scsi_type            = data.vsphere_virtual_machine.template.scsi_type
  firmware             = "efi"
  disk {
    label            = "disk0"
    size             = data.vsphere_virtual_machine.template.disks[0].size
    thin_provisioned = data.vsphere_virtual_machine.template.disks[0].thin_provisioned
  }

  folder = "TBD_Kiran"

  network_interface {
    network_id   = data.vsphere_network.network.id
    adapter_type = data.vsphere_virtual_machine.template.network_interface_types[0]
  }

  clone {
    linked_clone  = "false"
    template_uuid = data.vsphere_virtual_machine.template.id

    customize {
      linux_options {
        host_name   = "intftest01lvd"
        script_text = file("./customization.sh")
        domain      = "noam.fadv.net"
      }

      network_interface {
        ipv4_address = "10.74.4.194"
        ipv4_netmask = "24"
      }

      ipv4_gateway    = "10.74.4.1"
      dns_server_list = ["10.74.95.32", "10.74.95.51"]
      dns_suffix_list = ["noam.fadv.net", "apac.fadv.net", "scrn.fadv.net", "fadv.net"]
    }
  }
}
