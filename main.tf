data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

module "storage" {
  source                       = "./modules/storage"
  storage_account_name         = var.storage_account_name
  resource_group_name_sa       = data.azurerm_resource_group.rg.name
  resource_group_name_location = data.azurerm_resource_group.rg.location
}

module "database" {
  source              = "./modules/database"
  resource_group_name = data.azurerm_resource_group.rg.name

}