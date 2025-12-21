data "azurerm_key_vault" "datakeyvault" {
  name                = var.keyvaultname
  resource_group_name = var.rg_name
}
