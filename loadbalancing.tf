resource "azurerm_virtual_network" "lb-vnet" {
  name                = var.vnet_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = var.vnet_address_space
}

resource "azurerm_subnet" "LB-Subnet" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.lb-vnet.name
  address_prefixes     = var.subnet_address_prefixes
}




resource "azurerm_public_ip" "lb_public_ip" {
  name                = var.public_ip_name_lb
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = var.public_ip_allocation_method_lb
}

resource "azurerm_lb" "MyLB" {
  name                = var.lb_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  frontend_ip_configuration {
    name                 = var.frontend_ip_name
    public_ip_address_id = azurerm_public_ip.lb_public_ip.id
  }
}


resource "azurerm_lb_backend_address_pool" "MyBackendPool" {
  loadbalancer_id = azurerm_lb.MyLB.id
  name            = var.backend_pool_name
}


resource "azurerm_lb_probe" "ssh-inbound-probe" {
  loadbalancer_id = azurerm_lb.MyLB.id
  name            = var.probe_name
  protocol        = var.protocol
  port            = var.probe_port
}

resource "azurerm_lb_rule" "MyLB_Rule" {
  loadbalancer_id                = azurerm_lb.MyLB.id
  name                           = var.lb_rule_name
  protocol                       = var.protocol
  frontend_port                  = var.frontend_port
  backend_port                   = var.backend_port
  frontend_ip_configuration_name = var.frontend_ip_name
  probe_id                       = azurerm_lb_probe.ssh-inbound-probe.id
  backend_address_pool_ids       = ["${azurerm_lb_backend_address_pool.MyBackendPool.id}"]

}



