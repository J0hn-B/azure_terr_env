resource "azurerm_user_assigned_identity" "aks_managed_identity" {
  resource_group_name = azurerm_resource_group.rg_aks_01.name
  location            = azurerm_resource_group.rg_aks_01.location

  name = "aks-managed-identity"
}