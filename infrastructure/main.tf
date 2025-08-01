provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  client_id       = var.client_id
  client_secret   = var.client_secret
}

resource "azurerm_resource_group" "susaas_rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "random_integer" "suffix" {
  min = 10000
  max = 99999
}

resource "azurerm_cosmosdb_account" "susaas_cosmos" {
  name                = "susaascosmosdb${random_integer.suffix.result}"
  location            = azurerm_resource_group.susaas_rg.location
  resource_group_name = azurerm_resource_group.susaas_rg.name
  offer_type          = "Standard"
  kind                = "GlobalDocumentDB"

  consistency_policy {
    consistency_level = "Session"
  }

  geo_location {
    location          = azurerm_resource_group.susaas_rg.location
    failover_priority = 0
  }

  # ✅ Snyk Fixes
  public_network_access_enabled      = false
  access_key_metadata_writes_enabled = false
}

resource "azurerm_container_group" "susaas_backend" {
  name                = var.aci_name
  location            = azurerm_resource_group.susaas_rg.location
  resource_group_name = azurerm_resource_group.susaas_rg.name
  os_type             = "Linux"

  container {
    name   = "backend"
    image  = "${var.docker_username}/${var.image_name}:${var.image_tag}"
    cpu    = "0.5"
    memory = "1.5"

    ports {
      port     = var.aci_port
      protocol = "TCP"
    }
  }

  ip_address_type = "Public"
  dns_name_label  = "${var.aci_dns_label}-${random_integer.suffix.result}"
  tags            = var.tags
}
