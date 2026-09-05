variable "resource_group_name" {
  description = "Azure Resource Group name"
  type        = string
  default     = "hybrid-connect-gateway-project"
 }

variable "location" {
  description = "Azure region"
  type        = string
  default     = "Central India"
}

variable "vnet_address_space" {
  description = "VNet address space"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "gateway_subnet_prefix" {
  description = "VPN Gateway subnet"
  type        = string
  default     = "10.0.255.0/27"
}

variable "private_subnet_prefix" {
  description = "Private workload subnet"
  type        = string
  default     = "10.0.2.0/24"
}

variable "vpn_client_address_pool" {
  description = "P2S VPN client address pool"
  type        = list(string)
  default     = ["172.16.0.0/24"]
}

variable "admin_username" {
  description = "Linux VM administrator"
  type        = string
  default     = "azureadmin"
}

variable "ssh_public_key" {
  description = "SSH public key"
  type        = string
  sensitive   = true
}

variable "root_certificate_path" {
  description = "P2S root CA certificate"
  type        = string
  default     = "../certs/rootCA.cer"
}

variable "vm_size" {
  description = "Linux VM size"
  type        = string
  default     = "Standard_B2s"
}

variable "enable_monitoring" {
  description = "Enable VPN Gateway diagnostics"
  type        = bool
  default     = false
}
