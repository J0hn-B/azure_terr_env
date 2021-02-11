data "azurerm_key_vault" "key_vault_01" {
  name                = "terraform-keyvault01"
  resource_group_name = "azure-key-vault"
}

data "azurerm_key_vault_secret" "vm_ssh" {
  name         = "ssh-public-key"
  key_vault_id = data.azurerm_key_vault.key_vault_01.id
}

data "azurerm_key_vault_secret" "vm_pass" {
  name         = "app-general-pass"
  key_vault_id = data.azurerm_key_vault.key_vault_01.id
}
