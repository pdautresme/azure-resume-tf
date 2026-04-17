data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

resource "azurerm_static_web_app" "static_web_app" {
  name                = var.static_web_app_name
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location

  sku_tier          = var.sku_tier
  sku_size          = "Free"
  repository_url    = var.repository_url
  repository_branch = var.repository_branch
  repository_token  = var.repository_token

}
  