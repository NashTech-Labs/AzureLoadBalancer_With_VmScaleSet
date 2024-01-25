variable "rgname" {
    default = "my-rg" 
}

variable "first_public_key" {
    default = "<your_public_key>"
}

variable "rg_location" {
    default = "eastus" 
}

variable "scaleSet_name" {
    default = "myScaleSet" 
}

variable "scaleSet_sku" {
    default = "Standard_F2" 
}

variable "instances" {
    type = number
    default = 1
}

variable "admin_username" {
    default = "knoldus" 
}

variable "username" {
    default = "knoldus" 
}

variable "publisher" {
    default = "Canonical" 
}

variable "offer" {
    default = "0001-com-ubuntu-server-focal" 
}

variable "sku" {
    default = "20_04-lts" 
}

variable "version_source_image" {
    default = "latest" 
}

variable "storage_account_type" {
    default = "Standard_LRS" 
}

variable "caching" {
    default = "ReadWrite" 
}

variable "network_interface_name" {
    default = "nic-lb" 
}

variable "network_interface_primary" {
    type = bool
    default = true 
}

variable "ip_configuration_name" {
    default = "internal" 
}

variable "ip_configuration_primary" {
    type = bool
    default = true 
}

variable "autoscale_setting_name" {
    default = "my-autoscale-setting" 
}

variable "autoscale_setting__profile_name" {
    default = "default" 
}


variable "autoscale_setting_capacity_default" {
    type = number
    default = 1
}

variable "autoscale_setting_capacity_minimum" {
    type = number
    default = 1
}

variable "autoscale_setting_capacity_maximum" {
    type = number
    default = 3
}

variable "inmetric_trigger_name" {
    default = "Percentage CPU" 
}

variable "inmetric_trigger_threshold" {
    type = number
    default = 30
}

variable "inmetric_trigger_operator" {
    default = "GreaterThan" 
}

variable "inmetric_trigger_statistic" {
    default = "Average" 
}

variable "inmetric_trigger_time_aggregation" {
    default = "Average" 
}

variable "inmetric_trigger_time_grain" {
    default = "PT1M" 
}

variable "inmetric_trigger_time_window" {
    default = "PT1M" 
}

variable "scale_actionin_cooldown" {
    default = "PT1M" 
}

variable "scale_actionin_direction" {
    default = "Increase" 
}

variable "scale_actionin_type" {
    default = "PChangeCountT1M" 
}

variable "scale_actionin_value" {
    type = number
    default = 1
}

variable "scale_actionde_direction" {
    default = "Decrease" 
}

variable "scale_actionde_type" {
    default = "1ChangeCount" 
}

variable "scale_actionde_cooldown" {
    default = "PT5M" 
}

variable "scale_actionde_value" {
    type = number
    default = 1
}


variable "demetric_trigger_metric_name" {
  description = "Name of the metric"
  type        = string
  default     = "Percentage CPU"
}


variable "demetric_trigger_metric_namespace" {
  description = "Namespace of the metric"
  type        = string
  default     = "microsoft.compute/virtualmachinescalesets"
}

variable "demetric_trigger_time_grain" {
  description = "Time grain for the metric"
  type        = string
  default     = "PT1M"
}

variable "demetric_trigger_statistic" {
  description = "Statistic for the metric"
  type        = string
  default     = "Average"
}

variable "demetric_trigger_time_window" {
  description = "Time window for the metric"
  type        = string
  default     = "PT1M"
}

variable "demetric_trigger_time_aggregation" {
  description = "Time aggregation for the metric"
  type        = string
  default     = "Average"
}

variable "demetric_trigger_operator" {
  description = "Comparison operator for the metric"
  type        = string
  default     = "LessThan"
}

variable "demetric_trigger_threshold" {
  description = "Threshold value for the metric"
  type        = number
  default     = 10
}



variable "vnet_name" {
  description = "Name of the virtual network"
  type        = string
  default     = "lb-vnet"
}

variable "vnet_address_space" {
  description = "Address space for the virtual network"
  type        = list(string)
  default     = ["10.20.0.0/16"]
}

variable "subnet_name" {
  description = "Name of the subnet"
  type        = string
  default     = "LB-Subnet"
}

variable "subnet_address_prefixes" {
  description = "Address prefixes for the subnet"
  type        = list(string)
  default     = ["10.20.10.0/24"]
}

variable "public_ip_name_lb" {
  description = "Name of the public IP"
  type        = string
  default     = "lb-public-ip"
}

variable "public_ip_allocation_method_lb" {
  description = "Allocation method for the public IP"
  type        = string
  default     = "Dynamic"
}

variable "lb_name" {
  description = "Name of the load balancer"
  type        = string
  default     = "MyLB"
}

variable "frontend_ip_name" {
  description = "Name of the frontend IP configuration"
  type        = string
  default     = "MyLBFrontEndIP"
}

variable "backend_pool_name" {
  type        = string
  default     = "myBackendPool"
}

variable "probe_name" {
  description = "Name of the probe"
  type        = string
  default     = "ssh-inbound-probe"
}

variable "protocol" {
  description = "Protocol for the probe"
  type        = string
  default     = "Tcp"
}

variable "probe_port" {
  description = "Port for the probe"
  type        = number
  default     = 80
}

variable "lb_rule_name" {
  description = "Name of the load balancer rule"
  type        = string
  default     = "ssh-inbound-rule"
}

variable "frontend_port" {
  description = "Frontend port for the load balancer rule"
  type        = number
  default     = 80
}

variable "backend_port" {
  description = "Backend port for the load balancer rule"
  type        = number
  default     = 80
}




