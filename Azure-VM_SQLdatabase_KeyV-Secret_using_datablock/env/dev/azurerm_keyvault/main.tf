

data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "keyvaultblock" {
  name                        = var.keyvaultname
  location                    = var.location
  resource_group_name         = var.rg_name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false
  enable_rbac_authorization = true
  sku_name = "standard"

  # access_policy {
  #   tenant_id = data.azurerm_client_config.current.tenant_id
  #   object_id = data.azurerm_client_config.current.object_id

  #   key_permissions = [
  #     "Get",
  #   ]

  #   secret_permissions = [
  #     "Get","Backup", "Delete","List", "Purge", "Recover", "Restore", "Set"
  #   ]

  #   storage_permissions = [
  #     "Get",
  #   ]
  # }
}


resource "azurerm_role_assignment" "kv_secrets_officer" {
  depends_on = [azurerm_key_vault.keyvaultblock]
 
  scope                = azurerm_key_vault.keyvaultblock.id
  role_definition_name = "Key Vault Administrator"
  principal_id         = data.azurerm_client_config.current.object_id # SPN Object ID
}


# resource "azurerm_key_vault_secret" "vm-username-password" {
#   for_each = var.keyvaultsecreats
#   name         = each.value.name
#   value        = each.value.value
#   key_vault_id = azurerm_key_vault.keyvaultblock.id
# }
# resource "azurerm_key_vault_secret" "f-password" {
#   name         = "f-password"
#   value        = "Azure@123456"
#   key_vault_id = azurerm_key_vault.keyvaultblock.id
# }
# resource "azurerm_key_vault_secret" "b-adminname" {
#   name         = "b-username"
#   value        = "ashuvm-backend"
#     key_vault_id = azurerm_key_vault.keyvaultblock.id
# }
# resource "azurerm_key_vault_secret" "b-password" {
#   name         = "b-password"
#   value        = "Azure@123456"
#   key_vault_id = azurerm_key_vault.keyvaultblock.id
# }




  

