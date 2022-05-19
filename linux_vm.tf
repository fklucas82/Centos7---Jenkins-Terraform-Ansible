data "vsphere_datacenter" "dc" {
  name = "${var.datacenter}"
}

data "vsphere_datastore" "datastore" {
  name          = "${var.datastore}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_resource_pool" "pool" {
  name          = "${var.resource_pool}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_network" "network" {
  name          = "${var.network_name}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_virtual_machine" "template" {
  name          = "${var.template}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

resource "local_file" "hosts" {
  content  = templatefile("./templates/hosts.tpl",
    {
      hostname = "${var.vm_name}"
      ip = "${var.ipv4_addr}"
      pass = "${var.ansible_pw}"
    }
  )
  filename = "./hosts"
}

resource "vsphere_virtual_machine" "vm" {
  name             = "${var.vm_name}"
  resource_pool_id = "${data.vsphere_resource_pool.pool.id}"
  datastore_id     = "${data.vsphere_datastore.datastore.id}"
  folder            = "${var.vm_folder}"

  num_cpus = "${var.cpu_count}"
  memory   = "${var.memory_mb}"
  guest_id = "${data.vsphere_virtual_machine.template.guest_id}"

  scsi_type = "${data.vsphere_virtual_machine.template.scsi_type}"

  network_interface {
    network_id   = "${data.vsphere_network.network.id}"
    adapter_type = "${data.vsphere_virtual_machine.template.network_interface_types[0]}"
  }

  disk {
    label            = "${var.disk0_label}"
    unit_number      = 0
    size             = "${var.disk0_size}"
    eagerly_scrub    = false
    thin_provisioned = true
  }

  disk {
    label            = "${var.disk1_label}"
    unit_number      = 1
    size             = "${var.disk1_size}"
    eagerly_scrub    = false
    thin_provisioned = true
  }

  clone {
    template_uuid = "${data.vsphere_virtual_machine.template.id}"

    customize {
      linux_options {
        host_name = "${var.vm_name}"
        domain    = "${var.domain}"
      }
      network_interface {
        ipv4_address = "${var.ipv4_addr}"
        ipv4_netmask = "${var.ipv4_cidr}"
      }
      ipv4_gateway = "${var.ipv4_gw}"
      dns_server_list = "${var.dns_srv_list}"
      dns_suffix_list = "${var.dns_suffixes}"
    }
  }
}


