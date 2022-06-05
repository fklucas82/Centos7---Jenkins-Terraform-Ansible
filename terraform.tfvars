#Build variables
vm_name= "fkllab-jenkins"
#IP
domain= "fkl-lab.internal"
ipv4_addr="192.168.5.90"
ipv4_cidr= 22
ipv4_gw= "192.168.4.1"
#vSphere inventory variables
datacenter= "vSAN Datacenter"
vm_folder= "Linux"
vsphere_server= "vsanvcsa.fkl-lab.internal"
datastore= "vsanDatastore"
resource_pool= "vSAN Cluster/Resources"
network_name= "Default"
template= "CentOS7-Template"
#vm hardware variables
cpu_count= 2
memory_mb= 4096
disk0_label= "disk0"
disk0_size= 25
disk1_label= "disk1"
disk1_size= 25
disk2_label= "disk2"
disk2_size= 25
disk3_label= "disk3"
disk3_size= 25
disk4_label= "disk4"
disk4_size= 25
disk5_label= "disk5"
disk5_size= 5
#DNS
dns_srv_list= ["192.168.5.100", "192.168.5.101"]
dns_suffixes= ["fkl-lab.internal"]