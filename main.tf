data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

# module "database" {
#   source              = "./modules/database"
#   resource_group_name = data.azurerm_resource_group.rg.name

# }

module "app_service_static_web_app" {
  source              = "./modules/app_service_static_web_app"
  resource_group_name = data.azurerm_resource_group.rg.name
  repository_url      = var.repository_url
  repository_branch   = var.repository_branch
  repository_token    = var.repository_token
  static_web_app_name = var.static_web_app_name
}