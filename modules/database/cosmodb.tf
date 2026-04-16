data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

resource "azurerm_cosmosdb_account" "cdb_account" {
  name                = "pdacosmodbaccount"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  offer_type          = "Standard"
  kind                = "GlobalDocumentDB"

  capabilities {
    name = "EnableServerless"
  }

  geo_location {
    location          = data.azurerm_resource_group.rg.location
    failover_priority = 0
  }


  consistency_policy {
    consistency_level       = "BoundedStaleness"
    max_interval_in_seconds = 300
    max_staleness_prefix    = 100000
  }
  depends_on = [
    var.resource_group_name
  ]
}


resource "azurerm_cosmosdb_sql_database" "sql_database" {
  name                = "AzureResume"
  resource_group_name = data.azurerm_resource_group.rg.name
  account_name        = azurerm_cosmosdb_account.cdb_account.name
}

resource "azurerm_cosmosdb_sql_container" "sql_container" {
  name                  = "Counter"
  resource_group_name   = data.azurerm_resource_group.rg.name
  account_name          = azurerm_cosmosdb_account.cdb_account.name
  database_name         = azurerm_cosmosdb_sql_database.sql_database.name
  partition_key_paths   = ["/definition/id"]
  partition_key_version = 1

  indexing_policy {
    indexing_mode = "consistent"

    included_path {
      path = "/*"
    }

    included_path {
      path = "/included/?"
    }

    excluded_path {
      path = "/excluded/?"
    }
  }

  unique_key {
    paths = ["/definition/idlong", "/definition/idshort"]
  }
}

resource "azurerm_cosmosdb_sql_item" "counter_item" {
  resource_group_name = data.azurerm_resource_group.rg.name
  account_name        = azurerm_cosmosdb_account.cdb_account.name
  database_name       = azurerm_cosmosdb_sql_database.sql_database.name
  container_name      = azurerm_cosmosdb_sql_container.sql_container.name

  item = jsonencode({
    id = "visitor-counter"
    count = 0
    definition = {
      id = "visitor-counter"
      idlong = "visitor-counter-long"
      idshort = "vc"
    }
  })
}