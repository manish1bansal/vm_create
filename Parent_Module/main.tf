module "rgs" {
  source = "../Child_Module/azurerm_resource_group"
  rgs = var.rgs
}

module "stg" {
  source = "../Child_Module/azurerm_storage_account"
  stg = var.stg
  depends_on = [ module.rgs ]
}

module "vnets" {
  source = "../Child_Module/azurerm_virtual_network"
  vnets = var.vnets
  depends_on = [ module.rgs ]
}

module "sbnet" {
  source = "../Child_Module/azurerm_subnet"
  sbnet = var.sbnet
  depends_on = [ module.vnets ]
}

module "vms" {
  source = "../Child_Module/azurerm_virtual_machine"
  vms=var.vms
  subnet_id = module.sbnet.return_subnet
  depends_on = [ module.sbnet ]
}

variable "rgs" {}
variable "stg" {}
variable "vnets" {}
variable "sbnet" {}
variable "vms" {}