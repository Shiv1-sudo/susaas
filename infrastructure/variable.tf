variable "subscription_id" {
  description = "Azure subscription ID"
  type        = string
  sensitive   = true
}

variable "tenant_id" {
  description = "Azure tenant ID"
  type        = string
  sensitive   = true
}

variable "client_id" {
  description = "Azure client ID"
  type        = string
  sensitive   = true
}

variable "client_secret" {
  description = "Azure client secret"
  type        = string
  sensitive   = true
}

variable "location" {
  description = "Azure region location"
  type        = string
  default     = "canadacentral"
}

variable "docker_username" {
  description = "Docker Hub username"
  type        = string
  sensitive   = true
}

variable "image_name" {
  description = "Docker image name"
  type        = string
  default     = "susaas-backend"
}

variable "image_tag" {
  description = "Docker image tag"
  type        = string
  default     = "latest"
}

variable "resource_group_name" {
  description = "Azure resource group name"
  type        = string
  default     = "susaas-rg"
}

variable "aci_name" {
  description = "Azure Container Instance name"
  type        = string
  default     = "susaas-aci"
}

variable "aci_dns_label" {
  description = "DNS label for ACI"
  type        = string
  default     = "susaas-app"
}

variable "aci_port" {
  description = "Port for ACI container"
  type        = number
  default     = 8000
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
  default = {
    environment = "dev"
    project     = "SUSaaS"
  }
}
