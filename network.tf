resource "azurerm_virtual_network" "hybrid-connect-gateway-vnet" {
  name                = "hybrid-connect-gateway-vnet"
  location            = azurerm_resource_group.hybrid-connect-gateway-project.location
  resource_group_name = azurerm_resource_group.hybrid-connect-gateway-project.name

  address_space = var.vnet_address_space

}

resource "azurerm_subnet" "gateway" {
  name                 = "GatewaySubnet"
  resource_group_name  = azurerm_resource_group.hybrid-connect-gateway-project.name
  virtual_network_name = azurerm_virtual_network.hybrid-connect-gateway-vnet.name

  address_prefixes = [
    var.gateway_subnet_prefix
  ]
}

resource "azurerm_subnet" "private" {
  name                 = "private-subnet"
  resource_group_name  = azurerm_resource_group.hybrid-connect-gateway-project.name
  virtual_network_name = azurerm_virtual_network.hybrid-connect-gateway-vnet.name

  address_prefixes = [
    var.private_subnet_prefix
  ]
}


