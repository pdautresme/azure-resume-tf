terraform {
  required_version = ">=1.0.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.5.1"
    }
  }
}


provider "azurerm" {
  # Configuration options
  features {

  }
  subscription_id = "6bfa74e2-404b-4f15-84e0-1c0a5edd7450"
}

