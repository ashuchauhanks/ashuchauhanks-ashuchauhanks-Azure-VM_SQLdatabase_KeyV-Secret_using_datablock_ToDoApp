module "rg" {
  source   = "../env/dev/azurerm_resource_group"
  rg_name  = var.rg_name
  location = var.location
}

module "vnet" {
  depends_on    = [module.rg]
  source        = "../env/dev/azurerm_virtual_network"
  vnet_name     = var.vnet_name
  rg_name       = var.rg_name
  location      = var.location
  address_space = ["10.0.0.0/16"]
}

module "subnet" {
  depends_on  = [module.vnet]
  source      = "../env/dev/azurerm_subnet"
  subnet_name = var.subnet_name
  vnet_name   = var.vnet_name
  rg_name     = var.rg_name

  address_prefixes = ["10.0.0.0/24"]
}

module "subnet1" {
  depends_on  = [module.vnet]
  source      = "../env/dev/azurerm_subnet"
  subnet_name = var.subnet_name1
  vnet_name   = var.vnet_name
  rg_name     = var.rg_name

  address_prefixes = ["10.0.1.0/24"]
}


module "pip" {
  depends_on        = [module.rg]
  source            = "../env/dev/azurerm_public_ip"
  pip_name          = var.pip_name
  rg_name           = var.rg_name
  location          = var.location
  allocation_method = "Static"

}

module "pip1" {
  depends_on        = [module.rg]
  source            = "../env/dev/azurerm_public_ip"
  pip_name          = var.pip_name1
  rg_name           = var.rg_name
  location          = var.location
  allocation_method = "Static"

}

module "nsg" {
  depends_on = [module.rg]
  source     = "../env/dev/azurerm_network_security_group"
  nsg_name   = var.nsg_name
  rg_name    = var.rg_name
  location   = var.location
}

module "nsg1" {
  depends_on = [module.rg]
  source     = "../env/dev/azurerm_network_security_group"
  nsg_name   = var.nsg_name1
  rg_name    = var.rg_name
  location   = var.location
}
module "nic" {
  depends_on  = [module.rg, module.subnet, module.pip, module.nsg]
  source      = "../env/dev/azurerm_network_interface"
  nic_name    = var.nic_name
  rg_name     = var.rg_name
  location    = var.location
  subnet_name = var.subnet_name
  vnet_name   = var.vnet_name
  pip_name    = var.pip_name
  nsg_name    = var.nsg_name
}

module "nic1" {
  depends_on  = [module.rg, module.subnet1, module.pip1, module.nsg1]
  source      = "../env/dev/azurerm_network_interface"
  nic_name    = var.nic_name1
  rg_name     = var.rg_name
  location    = var.location
  subnet_name = var.subnet_name1
  vnet_name   = var.vnet_name
  pip_name    = var.pip_name1
  nsg_name    = var.nsg_name1
}

module "keyvaults" {
  # for_each = var.keyvaultsecreats
  depends_on   = [module.rg]
  source       = "../env/dev/azurerm_keyvault"
  keyvaultname = var.keyvaultname
  location     = var.location
  rg_name      = var.rg_name
  # keyvaultsecreats = var.keyvaultsecreats
}

module "keyvaultsecret" {
  # for_each         = var.keyvaultsecreats
  depends_on       = [module.keyvaults]
  source           = "../env/dev/azurerm_keyvault_secret"
  keyvaultname     = var.keyvaultname
  keyvaultsecreats = var.keyvaultsecreats
  rg_name          = var.rg_name
}

module "vm" {
  depends_on = [module.rg, module.nic, module.subnet, module.pip, module.nsg, module.keyvaultsecret]
  source     = "../env/dev/azurerm_virtual_machine"
  vm_name    = var.vm_name
  rg_name    = var.rg_name
  location   = var.location

  vm_size = "Standard_B2s_v2"
  # admin_username = data.azurerm_key_vault_secret.vm_admin_user.value
  # admin_password = data.azurerm_key_vault_secret.vm_admin_password.value
  nic_name  = var.nic_name
  publisher = var.publisher
  offer     = var.offer
  sku       = var.sku
  version0  = var.version0

  keyvaultname = var.keyvaultname
  # vmadminuser = "f-username"
  # vmpassword = "f-password"
  vmadminuser = var.vmadminuser
  vmpassword  = var.vmpassword

}

module "vm1" {
  depends_on = [module.rg, module.nic1, module.subnet1, module.pip1, module.nsg1, module.keyvaultsecret]
  source     = "../env/dev/azurerm_virtual_machine"
  vm_name    = var.vm_name1
  rg_name    = var.rg_name
  location   = var.location

  vm_size = "Standard_B2s_v2"
  # admin_username = data.azurerm_key_vault_secret.vm_admin_user.value
  # admin_password = data.azurerm_key_vault_secret.vm_admin_password.value

  # admin_username = "ashuvm-backend"
  # admin_password = "Azure@123456"
  nic_name = var.nic_name1

  publisher = var.publisher1
  offer     = var.offer1
  sku       = var.sku1
  version0  = var.version1

  keyvaultname = var.keyvaultname
  # vmadminuser = "b-username"
  # vmpassword = "b-password"
  vmadminuser = var.vm1adminuser
  vmpassword  = var.vm1password
}


module "sqlserver" {
  depends_on          = [module.rg, module.keyvaultsecret]
  source             = "../env/dev/azurerm_sql_server"
  sqlserver_name     = var.sqlserver_name
  rg_name            = var.rg_name
  location           = var.location
  sqlserver_admin    = var.sqlserver_admin
  sqlserver_password = var.sqlserver_password
  sqlfirewall_name   = var.sqlfirewall_name
}

module "sqldatabase" {
  depends_on        = [module.sqlserver]
  source            = "../env/dev/azurerm_sqldatabase"
  sql_database_name = var.sql_database_name
  sql_server_id     = module.sqlserver.sqlserverid

}


output "f-vm_public-ip" {
  value = module.pip.public_ip_address
  
}

output "b-vm_public-ip" {
  value = module.pip1.public_ip_address
  
}