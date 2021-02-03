resource "azurerm_resource_group" "example" {
  name     = "example"
  location = "North Europe"
}

output "rg_name" {
  value = azurerm_resource_group.example.name
}