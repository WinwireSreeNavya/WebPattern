terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~>2.0"
    }
  }
}

provider "azurerm" {  
  
  features {}
}

data "azurerm_client_config" "current" {}

resource "azurerm_app_service_plan" "example" {
  name                = "example-appserviceplan"
  location            = "East US"
  resource_group_name = "WW-CloudServiceManagement-RG-TBDNov30"

  sku {
    tier = "Basic"
    size = "B1"
  }
}

resource "azurerm_app_service" "example" {
  name                = "example-app-service"
  location            = "East US"
  resource_group_name = "WW-CloudServiceManagement-RG-TBDNov30"
  app_service_plan_id = azurerm_app_service_plan.example.id
}
