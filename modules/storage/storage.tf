resource "azurerm_storage_account" "storage_account" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name_sa
  location                 = var.resource_group_name_location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}