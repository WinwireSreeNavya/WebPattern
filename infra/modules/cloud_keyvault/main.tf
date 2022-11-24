terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.0"
    }
  }
}
data "azuread_client_config" "current" {}

provider "azurerm" {
  features {
  resource "azurerm_key_vault" "kv1" {
  name                        = "test_ww1"
  location                    = "East US"
  resource_group_name         = "WW-CloudServiceManagement-RG-TBDNov30"
  enabled_for_disk_encryption = true

  tenant_id                   = [data.azurerm_client_config.current.tenant_id]
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    object_id = [data.azurerm_client_config.current.object_id]

    key_permissions = [
      "Get",
    ]

    secret_permissions = [
      "Get",
    ]

    storage_permissions = [
      "Get",
    ]
  }
 }
}
