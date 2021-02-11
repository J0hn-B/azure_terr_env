#? AKS Resource Group 
variable "rg_aks_01_name" { default = "ltd-aks" }
variable "rg_vnet_01_name" { default = "ltd-virtual-networks" }
variable "rg_location" { default = "North Europe" }

#? AKS Nodes Resource Group name
variable "aks_node_rg_name" { default = "ltd-aks-resources" }

#? Azure Virtual Network Resources
variable "rg_vnet_resources_name" { default = "ltd-virtual-networks-resources" }
variable "rg_vnet_resources_location" { default = "North Europe" }

#******** Active servers running ***********************************************#
variable "ssh_instance_count" { default = 3 }
variable "pass_instance_count" { default = 1 }
#*******************************************************************************#

#? Azure Linux SSH Virtual Machines Resource Group
variable "rg_linux_vm_01_name" { default = "ltd-linux-ssh-vm-resources" }
variable "rg_linux_vm_01_location" { default = "North Europe" }

#? Azure Linux SSH Virtual Machines 
variable "linux_vm_01_name" { default = "linux-ssh-vm" }

#? Azure Linux Password Virtual Machines Resource Group
variable "rg_linux_vm_02_name" { default = "ltd-linux-pass-vm-resources" }
variable "rg_linux_vm_02_location" { default = "North Europe" }

#? Azure Linux Password Virtual Machines 
variable "linux_vm_02_name" { default = "linux-pass-vm" }

#? Tags
variable "default_tags" {
  type = map(string)
  default = {
    Environment : "Development"
    Project : "Main_Website"
  }
}
