resource "azurerm_resource_group" "example" {
  name     = var.RG
  location = var.location
}

resource "azurerm_virtual_network" "example" {
  name                = var.VNET
  address_space       = var.vnet_address
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}

resource "azurerm_subnet" "example" {
  name                 = var.SUBNET
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = var.subnet_address
}