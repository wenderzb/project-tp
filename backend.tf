terraform {
  backend "azurerm" {
    resource_group_name  = "backend-terraform"
    storage_account_name = "wendertp"
    key = "terraform.tfstate"
    container_name = "wendercontainer"
    }
}