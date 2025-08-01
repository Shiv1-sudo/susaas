resource_group_name = "susaas-rg"

image_name = "susaas-backend"
image_tag  = "latest"

aci_name      = "susaas-aci"
aci_dns_label = "susaas-app"
aci_port      = 8000

tags = {
  environment = "dev"
  project     = "SUSaaS"
}
