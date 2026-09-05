resource "azurerm_network_security_group" "hybrid-connect-gateway-private-nsg" {
  name                = "hybrid-connect-gateway-private-nsg"
  location            = azurerm_resource_group.hybrid-connect-gateway-project.location
  resource_group_name = azurerm_resource_group.hybrid-connect-gateway-project.name

  security_rule {
    name                       = "Allow-SSH-From-P2S"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"

    source_port_range      = "*"
    destination_port_range = "22"

    source_address_prefixes = var.vpn_client_address_pool

    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "Allow-ICMP-From-P2S"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Icmp"

    source_port_range      = "*"
    destination_port_range = "*"

    source_address_prefixes = var.vpn_client_address_pool

    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "hybrid-connect-gateway-private" {
  subnet_id                 = azurerm_subnet.private.id
  network_security_group_id = azurerm_network_security_group.hybrid-connect-gateway-private-nsg.id
}


