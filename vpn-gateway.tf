
resource "azurerm_public_ip" "hybrid-connect-gateway-vpn-pip" {
  name                = "hybrid-connect-gateway-vpn-pip"
  location            = azurerm_resource_group.hybrid-connect-gateway-project.location
  resource_group_name = azurerm_resource_group.hybrid-connect-gateway-project.name

  allocation_method = "Static"
  sku               = "Standard"

 
}

resource "azurerm_virtual_network_gateway" "hybrid-connect-gateway-vpn" {
  name                = "hybrid-connect-gateway-vpn-gateway"
  location            = azurerm_resource_group.hybrid-connect-gateway-project.location
  resource_group_name = azurerm_resource_group.hybrid-connect-gateway-project.name

  type     = "Vpn"
  vpn_type = "RouteBased"

  sku = "VpnGw1"

  active_active = false
  enable_bgp    = false

  ip_configuration {
    name = "vpnGatewayConfig"

    public_ip_address_id = azurerm_public_ip.hybrid-connect-gateway-vpn-pip.id

    private_ip_address_allocation = "Dynamic"

    subnet_id = azurerm_subnet.gateway.id
  }

  vpn_client_configuration {

    address_space = var.vpn_client_address_pool

    vpn_client_protocols = [
      "OpenVPN"
    ]

    vpn_auth_types = [
      "Certificate"
    ]

    root_certificate {
      name = "HybridConnectRootCA"

      public_cert_data = filebase64(
        var.root_certificate_path
      )
    }
  }

  }
