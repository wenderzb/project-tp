resource "azurerm_resource_group" "example" {
  name     = "aks-resource-group"
  location = "eastus"
}

resource "azurerm_kubernetes_cluster" "default" {
  name                = "talent-pool-aks"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  dns_prefix          = "dns-talent-pool"

  default_node_pool {
    name            = "default"
    node_count      = 2
    vm_size         = "Standard_D2_v2"
    os_disk_size_gb = 30
  }

  service_principal {
    client_id     = "5b982afa-26fb-43aa-b824-204fb084e564"
    client_secret = "t-bNkTo5loqLKC3OLLrg9iXTYHBG62cnfj"
  }

  role_based_access_control {
    enabled = true
  }

  tags = {
    environment = "Demo"
  }
}