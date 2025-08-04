output "backend_url" {
  value = "http://${azurerm_container_group.susaas_backend.fqdn}:${var.aci_port}/docs"
  description = "Base URL of the backend API with port"
}
