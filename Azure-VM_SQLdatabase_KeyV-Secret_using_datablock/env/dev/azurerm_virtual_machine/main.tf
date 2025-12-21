resource "azurerm_linux_virtual_machine" "vmblock" {
    name = var.vm_name
    location = var.location
    resource_group_name = var.rg_name
    network_interface_ids = [data.azurerm_network_interface.nic_data.id]
    size = var.vm_size
    
    # admin_username = var.admin_username
    # admin_password = var.admin_password
    admin_username = data.azurerm_key_vault_secret.vm_admin_user.value
    admin_password = data.azurerm_key_vault_secret.vm_admin_password.value

    disable_password_authentication = false

    os_disk {
    caching              = "ReadWrite"
    storage_account_type = "StandardSSD_LRS"
  }

  source_image_reference {
    # publisher = "Canonical"
    # offer     = "0001-com-ubuntu-server-jammy"
    # sku       = "22_04-lts"
    # version   = "latest"

    publisher = var.publisher
    offer     = var.offer
    sku       = var.sku
    version   = var.version0
  }

  custom_data = base64encode(<<EOF
#!/bin/bash
sudo apt-get update
sudo apt-get install -y nginx
sudo systemctl enable nginx
sudo systemctl start nginx
EOF
)
}
