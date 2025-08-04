variable "subscription_id" {
  type = string
}

variable "tenant_id" {
  type = string
}

variable "client_id" {
  type = string
}

variable "client_secret" {
  type      = string
  sensitive = true           # <-- Added sensitive flag to hide secret in output/logs
}

variable "resource_group_name" {
  type    = string
  default = "susaas-rg"      # <-- Added default value
}

variable "location" {
  type    = string
  default = "canadacentral"  # <-- Added default value
}

variable "cosmos_mongo_db_name" {
  type    = string
  default = "susaasdb"       # <-- Added default value
}

variable "cosmos_collection_name" {
  type    = string
  default = "urls"           # <-- Added default value
}

variable "aci_name" {
  type    = string
  default = "susaas-aci"     # <-- Added default value
}

variable "docker_username" {
  type = string
}

variable "image_name" {
  type    = string
  default = "susaas-backend" # <-- Added default value
}

variable "image_tag" {
  type    = string
  default = "latest"         # <-- Added default value
}

variable "aci_port" {
  type    = number
  default = 8000             # <-- Added default value
}

variable "aci_dns_label" {
  type    = string
  default = "susaas"         # <-- Added default value
}

variable "tags" {
  type = map(string)         # <-- Explicit map type for tags
  default = {                # <-- Default tags map
    environment = "dev"
    project     = "susaas"
  }
}
