# AKS Resource Group 
variable "rg_aks_01_name" { default = "ltd-aks" }
variable "rg_vnet_01_name" { default = "ltd-virtual-networks" }
variable "rg_location" { default = "North Europe" }

# AKS Nodes Resource Group name
variable "aks_node_rg_name" { default = "ltd-aks-resources" }

# Azure Linux Virtual Machines Resource Group
variable "rg_linux_vm_name" { default = "ltd-vm-resources" }
variable "rg_linux_vm_location" { default = "North Europe" }

# Azure Linux Virtual Machines 
variable "linux_vm_01_name" { default = "lnx-vm-01" }

# Azure Virtual Network Resources
variable "rg_vnet_resources_name" { default = "ltd-virtual-networks-resources" }
variable "rg_vnet_resources_location" { default = "North Europe" }
