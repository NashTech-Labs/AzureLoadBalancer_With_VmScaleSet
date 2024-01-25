locals {
  first_public_key = var.first_public_key
}

resource "azurerm_resource_group" "rg" {
  name = var.rgname
  location = var.rg_location

}

data "template_file" "nginx-cloud-init" {
  template = file("install-nginx.sh")
}


resource "azurerm_linux_virtual_machine_scale_set" "vmss" {
  name                = var.scaleSet_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = var.scaleSet_sku
  instances           = var.instances
  admin_username      = var.admin_username

  admin_ssh_key {
    username   = var.username
    public_key = local.first_public_key
  }

  custom_data = base64encode(data.template_file.nginx-cloud-init.rendered)

  source_image_reference {
    publisher = var.publisher
    offer     = var.offer
    sku       = var.sku
    version   = var.version_source_image
  }

  os_disk {
    storage_account_type = var.storage_account_type
    caching              = var.caching
  }

  network_interface {
    name    = var.network_interface_name
    primary = var.network_interface_primary

    ip_configuration {
      name                                   = var.ip_configuration_name
      primary                                = var.ip_configuration_primary
      subnet_id                              = azurerm_subnet.LB-Subnet.id
      load_balancer_backend_address_pool_ids = [azurerm_lb_backend_address_pool.MyBackendPool.id]
    }
  }

}

resource "azurerm_monitor_autoscale_setting" "example" {
  name                = var.autoscale_setting_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  target_resource_id  = azurerm_linux_virtual_machine_scale_set.vmss.id

  profile {
    name = var.autoscale_setting__profile_name
    capacity {
      default = var.autoscale_setting_capacity_default
      minimum = var.autoscale_setting_capacity_minimum
      maximum = var.autoscale_setting_capacity_maximum
    }
    rule {
      metric_trigger {
        metric_name        = var.inmetric_trigger_name
        metric_resource_id = azurerm_linux_virtual_machine_scale_set.vmss.id
        operator           = var.inmetric_trigger_operator
        statistic          = var.inmetric_trigger_statistic
        threshold          = var.inmetric_trigger_threshold
        time_aggregation   = var.inmetric_trigger_time_aggregation
        time_grain         = var.inmetric_trigger_time_grain
        time_window        = var.inmetric_trigger_time_window
      }
      scale_action {
        cooldown  = var.scale_actionin_cooldown
        direction = var.scale_actionin_direction
        type      = var.scale_actionin_type
        value     = var.scale_actionin_value
      }

      
    }
    rule {
      scale_action {
        direction = var.scale_actionde_direction
        type      = var.scale_actionde_type
        value     = var.scale_actionde_value
        cooldown  = var.scale_actionde_cooldown
      }
      metric_trigger {
        metric_name        = var.demetric_trigger_metric_name
        metric_resource_id = azurerm_linux_virtual_machine_scale_set.vmss.id
        metric_namespace   = var.demetric_trigger_metric_namespace
        time_grain         = var.demetric_trigger_time_grain
        statistic          = var.demetric_trigger_statistic
        time_window        = var.demetric_trigger_time_window
        time_aggregation   = var.demetric_trigger_time_aggregation
        operator           = var.demetric_trigger_operator
        threshold          = var.demetric_trigger_threshold
      }
    }
  }
}







