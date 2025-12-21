variable "rg_name" {
  # The name of the resource group
  type = string
  default = "ashurg-keyvault"
}
variable "location" {
  # The Azure region where the resources will be created
  type = string
  default = "Australia East"
}

variable "vnet_name" {
  # The name of the virtual network
  type = string
  default = "ashurg-vnet"
}
variable "subnet_name" {
  # The name of the subnet
  type = string
  default = "ashurg-front-subnet"
}

variable "pip_name" {
  # The name of the public IP address
  type = string
  default = "ashurg-pip-frontend"
}

variable "nsg_name" {
  # The name of the network security group
  type = string
  default = "ashurg-nsg-frontend"
}
variable "nic_name" {
  # The name of the network interface
  type = string
  default = "ashurg-nic-frontend"
}
variable "vm_name" {
  # The name of the virtual machine
  type = string
  default = "frondend-vm"
}
variable "publisher" {
  # The publisher of the VM image
  type = string
  default = "Canonical"
}
variable "offer" {
  # The offer of the VM image
  type = string
  default = "0001-com-ubuntu-server-jammy"
}
variable "sku" {
  # The SKU of the VM image
  type = string
  default = "22_04-lts"
}
variable "version0" {
  # The version of the VM image
  type = string
  default = "latest"
}
variable "vmadminuser" {
  # The username for the VM administrator
  type = string
  default = "ft-username"
}
variable "vmpassword" {
  # The password for the VM administrator
  type = string
  default = "ft-password"
}


#sql server variables
variable "sqlserver_name" {
  type = string
  default = "ashurg-sql-server"
}
variable "sqlserver_admin" {
  type = string
  # The administrator username for the SQL server
  default = "ashurg-sql-admin"
}
variable "sqlserver_password" {
  type = string
  # The administrator password for the SQL server 
  default = "Azure@123456"
}
variable "sqlfirewall_name" {
  type = string
  # The name of the SQL server firewall rule
  default = "ashurg-sql-firewall"
}
variable "sql_database_name" {
  type = string
  # The name of the SQL database
  default = "ashurg-sql-database"

}







variable "subnet_name1" {
  type = string
  # The name of the backend subnet
  default = "ashurg-backend-subnet"

}
variable "pip_name1" {
  type = string
  # The name of the public IP address for the backend
  default = "ashurg-pip-backend"
}
variable "nsg_name1" {
  type = string
  default = "ashurg-nsg-backend"
}
variable "nic_name1" {
  type = string
  # The name of the network interface for the backend
  default = "ashurg-nic-backend"
}
variable "vm_name1" {
  type = string
  # The name of the backend virtual machine
  default = "backend-vm"

}


variable "publisher1" {
  type = string
  # The publisher of the VM image for the backend
  default = "Canonical"
}
variable "offer1" {
  type = string
  # The offer of the VM image for the backend
  default = "0001-com-ubuntu-server-focal"
}
variable "sku1" {
  type = string
  # The SKU of the VM image for the backend
  default = "20_04-lts"
}
variable "version1" {
  type = string
  # The version of the VM image for the backend
  default = "latest"
}

variable "keyvaultsecreats" {
    type = map(object({
    name  = string
    value = string
  }))
  
  # A map of secrets to be stored in the Key Vault
}

variable "keyvaultname" {
  type = string
  # The name of the Key Vault where secrets will be stored
  default = "ashurg-keyvault"

}

variable "vm1adminuser" {
  type = string
  # The username for the backend VM administrator
  default = "bk-username"
}

variable "vm1password" {
  type = string
  # The password for the backend VM administrator
  default = "bk-password"

}


