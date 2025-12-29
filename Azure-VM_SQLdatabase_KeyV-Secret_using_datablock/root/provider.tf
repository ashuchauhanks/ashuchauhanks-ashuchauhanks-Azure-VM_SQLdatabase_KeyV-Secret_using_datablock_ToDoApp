terraform {
  
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=4.33.0"
    }
  }
   backend "azurerm" {
    resource_group_name  = "rg-bknd-ashu"
    storage_account_name = "stgbkendpipelineashu"
    container_name       = "tfcontainer"
    key                  = "root.tfstate"
  }
}

provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true

      purge_soft_deleted_secrets_on_destroy = true
      recover_soft_deleted_secrets          = true
    }

  }
  subscription_id = "bd6e61a5-d2a5-4a90-95dd-c977f616c3b7"
}



