variable "resource_group_name" {
  description = "The name of the resource group where the static web app will be created."
  type        = string
}

variable "static_web_app_name" {
  description = "The name of the static web app."
  type        = string
  default     = "static-resume-web-site"
}

variable "sku_tier" {
  description = "The SKU of the static web app."
  type        = string
  default     = "Free"
}

variable "repository_url" {
  description = "The URL of the repository containing the static web app code."
  type        = string
  default     = "https://github.com/example/static-resume-web-site.git"
}

variable "repository_branch" {
  description = "The branch of the repository containing the static web app code."
  type        = string
  default     = "main"
}

variable "repository_token" {
  description = "The token for accessing the repository."
  type        = string
  sensitive   = true
}