resource "azurerm_resource_group" "rg_aks_01" {
  name     = "aks-kubevirt"
  location = "North Europe"
}

output "rg_name" {
  value = azurerm_resource_group.rg_aks_01.name
}
