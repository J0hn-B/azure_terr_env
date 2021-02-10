resource "azurerm_public_ip" "vm_bastion" {
  name                = "bastion-pip"
  location            = azurerm_resource_group.rg_vnet_resources.location
  resource_group_name = azurerm_resource_group.rg_vnet_resources.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_bastion_host" "web_bastion" {
  name                = "web"
  location            = azurerm_resource_group.rg_vnet_resources.location
  resource_group_name = azurerm_resource_group.rg_vnet_resources.name

  ip_configuration {
    name                 = "bastion"
    subnet_id            = azurerm_subnet.bastion_subnet.id
    public_ip_address_id = azurerm_public_ip.vm_bastion.id
  }
}
