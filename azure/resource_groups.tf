resource "azurerm_resource_group" "rg_rbac_01" {
  name     = "rg-rbac-01"
  location = "North Europe"
}

output "rg_name" {
  value = azurerm_resource_group.rg_rbac_01.name
}