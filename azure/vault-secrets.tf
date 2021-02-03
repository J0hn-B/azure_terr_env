data "azurerm_key_vault" "vault_01" {
  name                = "terraform-keyvault01"
  resource_group_name = "azure-key-vault"
}

data "azurerm_key_vault_secret" "az_ad_domain_name" {
  name         = "azure-ad-domain-name"
  key_vault_id = data.azurerm_key_vault.vault_01.id
}

data "azurerm_key_vault_secret" "user_pass" {
  name         = "app-general-pass"
  key_vault_id = data.azurerm_key_vault.vault_01.id
}
