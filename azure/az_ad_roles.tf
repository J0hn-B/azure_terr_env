resource "azurerm_role_assignment" "dev_group_role" {
  scope                = data.azurerm_subscription.primary.id
  role_definition_name = "Contributor"
  principal_id         = azuread_group.developers.object_id
}
