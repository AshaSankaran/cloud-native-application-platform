rg_name  = "rg-cloud-native"
location = "centralindia"

vnet_name = "vnet-cloud-native"
vnet_address_space = [
  "10.10.0.0/16"
]

aks_subnet_name = "snet-aks"
aks_subnet_prefix = [
  "10.10.1.0/24"
]

acr_name      = "acrcloudnative"
acr_sku       = "Basic"
admin_enabled = false

aks_name   = "aks-cloud-native"
dns_prefix = "aks-cloud-native"
node_count = 2
vm_size    = "Standard_B2s_v2"

acr_role_definition_name     = "AcrPull"
backend_role_definition_name = "Key Vault Secrets User"

workspace_name          = "log-cloud-native"
workspace_sku           = "PerGB2018"
workspace_retentiondays = 30

diagnostic_setting_name  = "diag-aks-cloud-native"
action_group_name        = "ag-cloud-native-monitoring"
ag_short_name            = "cloud-native"
alert_email              = "ashasankaran11@gmail.com"
cpu_metric_alert_name    = "aks-metric-alert-high-cpu"
memory_metric_alert_name = "aks-metric-alert-high-memory"
pod_restart_alert_name   = "aks-cloud-native-pod-restarts"

key_vault_name = "keyvault-cloud-native"

identity_name = "id_backend-cloud-native"

backend_oidc_name = "fic-oidc-backend"