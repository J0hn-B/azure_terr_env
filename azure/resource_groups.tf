resource "azurerm_resource_group" "rg_aks_01" {
  name     = var.rg_aks_01_name
  location = var.rg_location
}

output "rg_name" {
  value = azurerm_resource_group.rg_aks_01.name
}

resource "azurerm_resource_group" "rg_vnet_01" {
  name     = var.rg_vnet_01_name
  location = var.rg_location
}
