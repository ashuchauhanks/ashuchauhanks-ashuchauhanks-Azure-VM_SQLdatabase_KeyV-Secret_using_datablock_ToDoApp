resource "azurerm_network_security_group" "nsgblock" {
    name = var.nsg_name
    location = var.location
    resource_group_name = var.rg_name

}

resource "azurerm_network_security_rule" "http_inbound" {
  name                        = "allow-http"
  priority                    = 120                    # SSH se alag hona chahiye
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "80"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = var.rg_name
  network_security_group_name = azurerm_network_security_group.nsgblock.name
}

resource "azurerm_network_security_rule" "ssh_inbound" {
  name                        = "allow-ssh"
  priority                    = 100            
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"            
  destination_port_range      = "22"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = var.rg_name
  network_security_group_name = azurerm_network_security_group.nsgblock.name
}