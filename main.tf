terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.75.0"
    }
  }
}

provider "azurerm" {
  skip_provider_registration = true
  features {}
}

resource "azurerm_resource_group" "resource_group" {
  location = var.resource_group_location
  name     = "${var.department_name}-${var.project_name}-${var.environment_name}"
}

resource "azurerm_application_insights" "app_insights" {
  name                = format("%s-ai", var.project_name)
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
  application_type    = "web"  
}

resource "azurerm_app_service_plan" "app_service_plan" {
  name                = format("%s-asp", var.project_name)
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name

  sku {
    tier = "Basic"
    size = "B1"
  }
}

resource "azurerm_app_service" "web_app_service" {
    name                = format("%s-web-as", var.project_name)
    location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
    app_service_plan_id = azurerm_app_service_plan.app_service_plan.id
  
    app_settings = {
        APPINSIGHTS_INSTRUMENTATIONKEY = azurerm_application_insights.app_insights.instrumentation_key
  }
}

resource "azurerm_app_service" "api_app_service" {
    name                = format("%s-api-as", var.project_name)
 location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
    app_service_plan_id = azurerm_app_service_plan.app_service_plan.id
  
    app_settings = {
        APPINSIGHTS_INSTRUMENTATIONKEY = azurerm_application_insights.app_insights.instrumentation_key
  }
}

resource "azurerm_storage_account" "storage_account" {
     name                        = format("%ssa", var.project_name)
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
    account_tier                 = "Standard"
    account_replication_type     = "LRS"  
}

resource "azurerm_mssql_server" "database" {
    name                         =  format("%s-db", var.project_name)
 location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
    version                      = "12.0"
    administrator_login          = "4dm1n157r470r"
    administrator_login_password = "4-v3ry-53cr37-p455w0rd"
}
