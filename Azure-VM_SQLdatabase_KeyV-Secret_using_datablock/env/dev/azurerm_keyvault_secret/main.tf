resource "azurerm_key_vault_secret" "vm-username-password" {
  for_each = var.keyvaultsecreats
  name         = each.value.name
  value        = each.value.value
  key_vault_id = data.azurerm_key_vault.datakeyvault.id
}