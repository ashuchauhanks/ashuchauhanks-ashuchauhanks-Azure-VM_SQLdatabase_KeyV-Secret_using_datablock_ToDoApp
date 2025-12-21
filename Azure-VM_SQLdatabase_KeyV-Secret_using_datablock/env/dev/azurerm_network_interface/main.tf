resource "azurerm_network_interface" "nicblock" {
    name = var.nic_name
    location = var.location
    resource_group_name = var.rg_name
    ip_configuration {

        name = "internal"
        subnet_id = data.azurerm_subnet.data_subnet.id
        private_ip_address_allocation = "Dynamic"
        public_ip_address_id = data.azurerm_public_ip.data_public_ip.id
    }    


    
    }

resource "azurerm_network_interface_security_group_association" "example" {
  network_interface_id      = azurerm_network_interface.nicblock.id
  network_security_group_id = data.azurerm_network_security_group.data_nsg.id
}
