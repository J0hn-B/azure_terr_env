resource "azurerm_subnet_network_security_group_association" "vm_nsg_01" {
  subnet_id                 = azurerm_subnet.azure_cni_02.id
  network_security_group_id = azurerm_network_security_group.vm_nsg_01.id
}

resource "azurerm_network_security_group" "vm_nsg_01" {
  name                = "tls_server"
  location            = azurerm_resource_group.rg_linux_vm.location
  resource_group_name = azurerm_resource_group.rg_linux_vm.name
}

resource "azurerm_network_security_rule" "web_subnet_rule" {
  count                       = length(var.rules_app)
  access                      = element(split(",", var.rules_app[count.index]), 0)
  destination_address_prefix  = element(split(",", var.rules_app[count.index]), 1)
  destination_port_range      = element(split(",", var.rules_app[count.index]), 2)
  name                        = element(split(",", var.rules_app[count.index]), 3)
  priority                    = element(split(",", var.rules_app[count.index]), 4)
  protocol                    = element(split(",", var.rules_app[count.index]), 5)
  source_address_prefix       = element(split(",", var.rules_app[count.index]), 6)
  source_port_range           = element(split(",", var.rules_app[count.index]), 7)
  direction                   = element(split(",", var.rules_app[count.index]), 8)
  resource_group_name         = azurerm_resource_group.rg_linux_vm.name
  network_security_group_name = azurerm_network_security_group.vm_nsg_01.name
}

variable "rules_app" {
  description = "Create nsg rules"
  type        = map(string)

  default = {
    "0" = "Allow,*,80,port 80,1000,*,*,*,Inbound"
    "1" = "Allow,*,8080,port 8080,1015,*,*,*,Inbound"
    "2" = "Allow,*,22,port 22,1016,*,*,*,Inbound"
  }
}
