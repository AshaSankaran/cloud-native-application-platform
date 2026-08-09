terraform {
  backend "azurerm" {
    resource_group_name  = "rg-terraform-backend"
    storage_account_name = "stcloudnativetfstate"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}