data "azurerm_network_interface" "nic_data" {
  name                = var.nic_name
  resource_group_name = var.rg_name
  
}

data "azurerm_key_vault_secret" "vm_admin_user" {
  name         = var.vmadminuser
  key_vault_id = data.azurerm_key_vault.datakeyvault.id
}

data "azurerm_key_vault_secret" "vm_admin_password" {
  name         = var.vmpassword
  key_vault_id = data.azurerm_key_vault.datakeyvault.id
}

data "azurerm_key_vault" "datakeyvault" {
  name                = var.keyvaultname
  resource_group_name = var.rg_name
}