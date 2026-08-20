variable "diagnostic_setting_name" {
    description = "Monitoring Diagnostic Setting Name"
    type = string
}

variable "action_group_name" {
    description = "Monitoring Action Group Name"
    type = string
}

variable "ag_short_name" {
    description = "Monitoring Action Group Short Name"
    type = string
}

variable "alert_email" {
    description = "Monitoring Alert Email Address"
    type = string
}

variable "cpu_metric_alert_name" {
    description = "AKS CPU Metrics Alert Name"
    type = string
}

variable "memory_metric_alert_name" {
    description = "AKS Memory Metrics Alert Name"
    type = string
}

variable "log_analytics_workspace_id" {
    description = "Log Analytics workspace resource ID"
    type = string
}

variable "aks_id" {
    description = "AKS Resource ID"
    type = string
}

variable "aks_name" {
    description = "AkS Resource Name"
    type = string
}

variable "resource_group_name" {
    description = "Resource Group Name"
    type = string
}

variable "location" {
    description = "Azure Region"
}