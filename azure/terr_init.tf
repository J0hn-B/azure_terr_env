provider "azurerm" {
  features {}
}
provider "azuread" {}

#* Backend for remote state. Create Storage first.
terraform {
  backend "azurerm" {
    resource_group_name  = "terraform-tfstate"
    storage_account_name = "terrstatedev"
    container_name       = "terraformdev"
    key                  = "azure_terr_env.tfstate"
  }
}
