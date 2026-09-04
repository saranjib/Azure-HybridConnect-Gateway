resource "azurerm_resource_group" "hybrid-connect-gateway-project" {
  name     = var.resource_group_name
  location = var.location

}
