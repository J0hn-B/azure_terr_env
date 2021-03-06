resource "azurerm_network_interface" "vm_nic_02" {
  count               = var.pass_instance_count
  name                = "${var.linux_vm_02_name}-${count.index}-nic"
  location            = azurerm_resource_group.rg_linux_vm_02.location
  resource_group_name = azurerm_resource_group.rg_linux_vm_02.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.azure_cni_02.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_availability_set" "vm_av_set_02" {
  name                         = "linux-pass-vm-avset"
  location                     = azurerm_resource_group.rg_linux_vm_02.location
  resource_group_name          = azurerm_resource_group.rg_linux_vm_02.name
  platform_fault_domain_count  = 2
  platform_update_domain_count = 2
  managed                      = true
}


resource "azurerm_linux_virtual_machine" "linux_vm_02" {
  count                           = var.pass_instance_count
  name                            = "${var.linux_vm_02_name}-${count.index}"
  resource_group_name             = azurerm_resource_group.rg_linux_vm_02.name
  location                        = azurerm_resource_group.rg_linux_vm_02.location
  size                            = "Standard_B2s"
  admin_username                  = "adminuser"
  admin_password                  = data.azurerm_key_vault_secret.vm_pass.value
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.vm_nic_02[count.index].id,
  ]

  # VM with password, stored in an Azure Key Vault
  os_disk {
    name                 = "${var.linux_vm_02_name}-${count.index}-osdisk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
  tags = var.default_tags
}
