
variable "rg_name" {
   # description = "The name of the resource group where the VM will be created."
   type = string
}
variable "location" {
   # description = "The Azure region where the VM will be deployed."
   type = string
}
variable "vm_name" {
   # description = "The name of the virtual machine."
   type = string
}
variable "vm_size" {
   # default     = "Standard_DS1_v2"
   type        = string
   # description = "The size of the virtual machine."
}

# variable "admin_username" {}
# variable "admin_password" {}


variable "nic_name" {
   # description = "The name of the network interface."
   type        = string
}

variable "publisher"{
   # description = "The publisher of the VM image."
   type        = string
}
variable "offer" {
   # description = "The offer of the VM image."
   type        = string
}
variable "sku" {
   # description = "The SKU of the VM image."
   type        = string
} 
variable "version0" {
   # description = "The version of the VM image."
   type        = string
}


variable "keyvaultname" {
   # description = "The name of the Key Vault where secrets are stored."
   type        = string
}
variable "vmadminuser" {
   # description = "The username for the VM administrator."
   type        = string
}
variable "vmpassword" {
   # description = "The password for the VM administrator."
   type        = string
}