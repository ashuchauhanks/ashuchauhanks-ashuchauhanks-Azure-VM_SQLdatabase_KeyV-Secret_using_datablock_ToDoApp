variable "keyvaultsecreats" {
   type = map(object({
  name  = string
  value = string
}))

   
}
variable "keyvaultname" {
    type = string
}

variable "rg_name" {
    type = string
}