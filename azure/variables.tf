# Resource Group names
variable "rg_aks_01_name" { default = "ltd-aks" }
variable "rg_vnet_01_name" { default = "ltd-virtual-networks" }
variable "rg_location" { default = "North Europe" }

# AKS Nodes Resource Group name
variable "aks_node_rg_name" { default = "ltd-aks-resources" }
