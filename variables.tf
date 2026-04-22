variable "resource_group_name" {
  description = "The name of the resource group in which to create the storage account."
  type        = string
}

variable "storage_account_name" {
  description = "The name of the storage account to create."
  type        = string
}

variable "repository_url" {
  description = "The URL of the GitHub repository for the static web app."
  type        = string
}

variable "repository_branch" {
  description = "The branch of the repository to deploy."
  type        = string
  default     = "main"
}

variable "repository_token" {
  description = "The GitHub personal access token for accessing the repository."
  type        = string
  sensitive   = true
}

variable "static_web_app_name" {
  description = "The name of the static web app."
  type        = string
}

variable "dns_zone_name" {
  description = "The name of the DNS zone where the CNAME record will be created."
  type        = string
}

variable "custom_domain_name" {
  description = "The custom domain name to be associated with the static web app."
  type        = string
}