#Build variables
vm_name= "VDR-T-TFANS"

#IP
domain= "sfg.corp.local"
ipv4_addr="10.53.160.53"
ipv4_cidr= 24
ipv4_gw= "10.53.160.1"

#vSphere inventory variables
datacenter= "Des Moines"
vm_folder= "Des Moines Test Servers/DSM-TST-SRVRS-Reboot 4th"
vsphere_server= "vss-vcenter-vapp.sfg.corp.local"
datastore= "DSMCL01_R401_NFSv3"
resource_pool= "DSM - Test - General VMs"
network_name= "Default"
template= "VDR-T-RH8S"

#vm hardware variables
cpu_count= 2
memory_mb= 4096
disk0_label= "disk0"
disk0_size= 60

#DNS
dns_srv_list= ["10.53.10.20", "10.53.10.21"]
dns_suffixes= ["fkl-lab.internal"]