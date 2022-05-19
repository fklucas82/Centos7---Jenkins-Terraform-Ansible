
#Build variables
vm_name= "wdm4demo"
#IP
domain= "ia.wd.org"
ipv4_addr="10.1.10.15"
ipv4_cidr= 19
ipv4_gw= "10.1.0.1"
#vSphere inventory variables
datacenter= "IWD_Prod"
vm_folder= "Linux/Linux_Prod"
vsphere_server= "vcenterd.ia.wd.org"
datastore= "iwd_ds0"
resource_pool= "Server Cluster/Resources"
network_name= "DPG_100"
template= "c74ta"
#vm hardware variables
cpu_count= 2
memory_mb= 4096
disk0_label= "disk0"
disk0_size= 80
disk1_label= "disk1"
disk1_size= 50
#DNS
dns_srv_list= ["10.1.0.145", "10.1.0.146"]
dns_suffixes= ["ia.wd.org", "wd.org"]