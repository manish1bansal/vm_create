resource "azurerm_storage_account" "stg" {
  for_each = var.stg
  name = each.value.stgname
  location = each.value.location 
  resource_group_name = each.value.rgname 
  account_replication_type = each.value.account_replication_type
  account_tier = each.value.account_tier
}

variable "stg" {}