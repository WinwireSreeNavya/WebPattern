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

resource "azurerm_application_insights" "ai" {
  name                = "exampleCloudService-ai"
  location            = "East US"
  resource_group_name = "WW-CloudServiceManagement-RG-TBDNov30"
  application_type    = "web"  
}

resource "azurerm_app_service" "example" {
  name                = "example-app-serviceCSM"
  location            = "East US"
  resource_group_name = "WW-CloudServiceManagement-RG-TBDNov30"
  app_service_plan_id = azurerm_app_service_plan.example.id
  
  app_settings = {
    APPINSIGHTS_INSTRUMENTATIONKEY = azurerm_application_insights.ai.instrumentation_key
  }
}

resource "azurerm_storage_account" "example" {
  name                     = "examplestrgacctnamecsm"
  resource_group_name      = "WW-CloudServiceManagement-RG-TBDNov30"
  location                 = "East US"
  account_tier             = "Standard"
  account_replication_type = "LRS"  
}

resource "azurerm_mssql_server" "example" {
  name                         = "example-sqlservercsm"
  resource_group_name          = "WW-CloudServiceManagement-RG-TBDNov30"
  location                     = "East US"
  version                      = "12.0"
  administrator_login          = "4dm1n157r470r"
  administrator_login_password = "4-v3ry-53cr37-p455w0rd"
}
