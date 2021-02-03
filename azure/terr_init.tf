provider "azurerm" {
  # Version is optional
  version = "~> 2.45.0"
  features {}
}

#* Backend for remote state. Create Storage first.
terraform {
  backend "azurerm" {
    resource_group_name  = "terraform-tfstate"
    storage_account_name = "terrstatedev"
    container_name       = "terraformdev"
    key                  = "azure_terr_env.tfstate"
  }
}
