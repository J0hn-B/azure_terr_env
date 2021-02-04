# Create the Azure AD groups

resource "azuread_group" "developers" {
  display_name = "devs-az-ad-group"
  members = [
    azuread_user.user_0.object_id
  ]
}

resource "azuread_group" "s_r_e" {
  display_name = "srengineers-az-ad-group"
}

resource "azuread_group" "admin" {
  display_name = "admins-az-ad-group"
}

# Assigns a given Principal (User or Group) to a given Role
data "azurerm_subscription" "primary" {}


resource "azurerm_role_assignment" "dev_group_role" {
  scope                = data.azurerm_subscription.primary.id
  role_definition_name = "Contributor"
  principal_id         = azuread_group.developers.object_id
}
