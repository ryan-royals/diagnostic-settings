terraform {
  required_version = ">= 1.3.1"
  required_providers {

    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0.0"
    }
  }
}
