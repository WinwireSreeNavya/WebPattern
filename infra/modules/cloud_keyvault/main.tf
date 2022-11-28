data "azuread_client_config" "current" {}

resource "azurerm_key_vault" "kv1" {
  name                        = var.keyvault_name
  location                    = "East US"
  resource_group_name         = var.resource_group_name
  tenant_id                   = "bdcfaa46-3f69-4dfd-b3f7-c582bdfbb820"
  enabled_for_disk_encryption = true
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"
}
