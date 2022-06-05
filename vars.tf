# vSphere Connection Variables
variable "vsphere_user" {}
variable "vsphere_password" {}
variable "vsphere_server" {}

# Build Variables"
variable "datacenter" {}
variable "datastore" {}
variable "resource_pool" {}
variable "network_name" {}
variable "template" {}
variable "vm_name" {}
variable "vm_folder" {}
variable "cpu_count" {}
variable "memory_mb" {}
variable "disk0_label" {}
variable "disk0_size" {}
variable "disk1_label" {}
variable "disk1_size" {}
variable "disk2_label" {}
variable "disk2_size" {}
variable "disk3_label" {}
variable "disk3_size" {}
variable "disk4_label" {}
variable "disk4_size" {}
variable "disk5_label" {}
variable "disk5_size" {}

#IP and DNS
variable "domain" {}
variable "ipv4_addr" {}
variable "ipv4_cidr" {}
variable "ipv4_gw" {}
variable "dns_srv_list" {}
variable "dns_suffixes" {}

#ansible connectionn variables
variable "ansible_user" {}
variable "ansible_pw" {}
variable "ansible_become_user" {}
variable "ansible_become_password" {}

# Ansible Playbook Variables
variable "ad_user" {}
variable "ad_pass" {}
