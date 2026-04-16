variable "resource_group_name" {
  description = "The name of the resource group where the Cosmos DB account will be created."
  type        = string
}

variable "prefix" {
  description = "The prefix for the resource names."
  type        = string
  default = "az"
}