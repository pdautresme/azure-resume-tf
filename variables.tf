variable "resource_group_name" {
  description = "The name of the resource group in which to create the storage account."
  type        = string
  default     = "RG-Resume-tf"
}

variable "storage_account_name" {
  description = "The name of the storage account to create."
  type        = string
  default     = "stresumetf"
}

variable "repository_url" {
  description = "The URL of the GitHub repository for the static web app."
  type        = string
  default     = "https://github.com/pdautresme/static-resume-web-site.git"
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
  default     = "static-resume-web-site"
}