terraform {
  required_version = ">= 1.1.0"
  cloud {
    organization = "winwire"

    workspaces {
      name = "tfdeploy"
    }
  }
}

provider "azurerm" {
  features {}
}
