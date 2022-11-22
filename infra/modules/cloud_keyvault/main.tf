data "azuread_client_config" "current" {}

resource "azurerm_key_vault" "kv1" {
  name                        = "test_ww"
  location                    = "East US"
  resource_group_name         = "WW-CloudServiceManagement-RG-TBDNov30"
  tenant_id                   = [data.azurerm_client_config.current.tenant_id]
  enabled_for_disk_encryption = true

  tenant_id                   = [data.azurerm_client_config.current.tenant_id]
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = [data.azurerm_client_config.current.tenant_id]
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
