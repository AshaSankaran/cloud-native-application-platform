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
node_count = 1
vm_size    = "Standard_B2s_v2"

role_definition_name = "AcrPull"