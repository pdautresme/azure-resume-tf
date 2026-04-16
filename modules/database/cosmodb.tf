data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

resource "azurerm_cosmosdb_account" "cdb_account" {
  name                = random_pet.prefix.id
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  offer_type          = "Standard"
  kind                = "GlobalDocumentDB"
  

  
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

resource "azurerm_cosmosdb_sql_database" "main" {
  name                = "${random_pet.prefix.id}-AzureResume"
  resource_group_name = data.azurerm_resource_group.rg.name
  account_name        = azurerm_cosmosdb_account.cdb_account.name
  throughput          = "400"
}

resource "azurerm_cosmosdb_sql_container" " resume_container" {
  name                  = "${random_pet.prefix.id}-Counter"
  resource_group_name   = data.azurerm_resource_group.rg.name
  account_name          = azurerm_cosmosdb_account.cdb_account.name
  database_name         = azurerm_cosmosdb_sql_database.main.name
  partition_key_paths    = ["/definition/id"]
  partition_key_version = 1
  throughput            = "400"

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

resource "random_pet" "prefix" {
  prefix = var.prefix
  length = 1
}