# Create the Azure AD users
resource "azuread_user" "user_0" {
  user_principal_name = "johnb@${data.azurerm_key_vault_secret.az_ad_domain_name.value}"
  display_name        = "J0hn-B"
  password            = data.azurerm_key_vault_secret.user_pass.value
}
