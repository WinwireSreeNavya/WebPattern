terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~>2.0"
    }
  }
}

provider "azurerm" {  

  version = "2.5.0"
  client_id         = ${{ secrets.ARM_CLIENT_ID }}
  client_secret     = ${{ secrets.ARM_CLIENT_SECRET }}
  subscription_id   = ${{ secrets.ARM_SUBSCRIPTION_ID }}  
  tenant_id         = ${{ secrets.ARM_TENANT_ID }}
  
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "WW-CloudServiceManagement-RG-TBDNov30"
  location = "East US"
}

resource "azurerm_app_service_plan" "example" {
  name                = "example-appserviceplan"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  sku {
    tier = "Basic"
    size = "B1"
  }
}

resource "azurerm_app_service" "example" {
  name                = "example-app-service"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  app_service_plan_id = azurerm_app_service_plan.example.id
}
