# TF_Ans_Centos7_VM

This project is intended to create a CentOS 7 VM that has our standard configuration, to provide a solid foundation for future projects.

This should be easily adapted to future vSphere templates for CentOS or RedHat.  This is built around the template in use today.

The template contains multiple prerequisites that persist when cloned, the ansible playbooks are added due to the dynamic nature of the AD and agent installs.

dnf should be the only prerequisite that is needed but not present in the playbooks.

1. Clones a vSphere VM from the defined template
2. Places the VM in the defined datacenter, cluster, datastore
3. Configures CPU, RAM, Disks, IP, DNS
4. Joins the VM to AD
5. Installs and configures baseline applications - (standard-build.yml) Nagios Agent, FireEye Agent, (get-automox.yml) Automox Agent
6. Performs a dnf update for all installed packages (standard-build.yml)

The terraform builds the hosts file used by the ansible playbook based on templates/hosts.tpl - this allows the terraform variables to be reused so that it only needs to be defined once.

Jenkins calls Terraform to build the VM (linux_vm.tf), then calls the Ansible Playbooks.

Credentials are configured in Jenkins and called using the jenkinsfile.

To Do:
1. Add error catching.  
2. Set up a terraform destroy for some errors.
3. Add logic to only use terraform init when necessary.
4. Test other methods for credentials.
5. Improve idempotency.

This is intended for one VM.  A future project is to rework it to a defined number of VMs.
I'd like to make an AWS and/or Azure version.


Credentials Needed (From Jenkins Credential Repository):
1. vCenter Username/Password (vcenter_creds, vsphere_user, vsphere_password)
2. Ansible Become Username/Password (ansible_become_creds, ansible_become_user, ansible_become_password)
3. Ansible SSH Username/Password (ansible_ssh_creds, ansible_user, ansible_pw)
4. Active Directory Join Username/Password (ad_join_creds, ad_user, add_pass)
5. Nagios NCPA agent token (ncpa_token)
6. Nagios XI key (xi_api_key)

