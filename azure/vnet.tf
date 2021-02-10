resource "azurerm_virtual_network" "vnet_01" {
  name                = "virtual-network-01"
  location            = azurerm_resource_group.rg_vnet_01.location
  resource_group_name = azurerm_resource_group.rg_vnet_01.name
  address_space       = ["10.1.0.0/17"]
}

resource "azurerm_subnet" "azure_cni_01" {
  name                 = "k8s-subnet"
  virtual_network_name = azurerm_virtual_network.vnet_01.name
  resource_group_name  = azurerm_resource_group.rg_vnet_01.name
  address_prefixes     = ["10.1.0.0/19"]
}

resource "azurerm_subnet" "azure_cni_02" {
  name                 = "vms-subnet"
  virtual_network_name = azurerm_virtual_network.vnet_01.name
  resource_group_name  = azurerm_resource_group.rg_vnet_01.name
  address_prefixes     = ["10.1.32.0/19"]
}

resource "azurerm_subnet" "bastion_subnet" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = azurerm_resource_group.rg_vnet_01.name
  virtual_network_name = azurerm_virtual_network.vnet_01.name
  address_prefixes     = ["10.1.127.224/27"]
}
