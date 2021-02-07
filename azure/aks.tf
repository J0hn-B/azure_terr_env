resource "azurerm_kubernetes_cluster" "aks_01" {
  name                = "aks-01"
  location            = azurerm_resource_group.rg_aks_01.location
  resource_group_name = azurerm_resource_group.rg_aks_01.name
  dns_prefix          = "aks01"

  default_node_pool {
    name                = "vmscaleset"
    type                = "VirtualMachineScaleSets"
    enable_auto_scaling = true
    min_count           = 1
    max_count           = 4
    vm_size             = "Standard_B2s"
    vnet_subnet_id      = azurerm_subnet.azure_cni_01.id
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Development"
  }
}
