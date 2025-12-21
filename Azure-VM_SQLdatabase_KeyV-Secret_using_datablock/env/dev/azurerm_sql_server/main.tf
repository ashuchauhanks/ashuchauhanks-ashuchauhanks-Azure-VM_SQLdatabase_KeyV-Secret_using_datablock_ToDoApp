

resource "azurerm_mssql_server" "sqlserverblock" {
  name                         = var.sqlserver_name
  resource_group_name          = var.rg_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = var.sqlserver_admin
  administrator_login_password = var.sqlserver_password
 
  minimum_tls_version          = "1.2"

#   azuread_administrator {
#     login_username = "AzureAD Admin"
#     object_id      = "00000000-0000-0000-0000-000000000000"
#   }
}
resource "azurerm_mssql_firewall_rule" "firewallsqlblock" {
  name             = var.sqlfirewall_name
  server_id        = azurerm_mssql_server.sqlserverblock.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "0.0.0.0"
}