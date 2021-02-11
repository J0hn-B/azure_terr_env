resource "azurerm_network_interface" "vm_nic_01" {
  count               = var.instance_count
  name                = "${var.linux_vm_01_name}-${count.index}-vm-nic"
  location            = azurerm_resource_group.rg_linux_vm.location
  resource_group_name = azurerm_resource_group.rg_linux_vm.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.azure_cni_02.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_availability_set" "vm_av_set_01" {
  name                         = "linux-vm-avset"
  location                     = azurerm_resource_group.rg_linux_vm.location
  resource_group_name          = azurerm_resource_group.rg_linux_vm.name
  platform_fault_domain_count  = 2
  platform_update_domain_count = 2
  managed                      = true
}


resource "azurerm_linux_virtual_machine" "linux_vm_01" {
  count               = var.instance_count
  name                = "${var.linux_vm_01_name}-${count.index}"
  resource_group_name = azurerm_resource_group.rg_linux_vm.name
  location            = azurerm_resource_group.rg_linux_vm.location
  size                = "Standard_B2s"
  admin_username      = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.vm_nic_01.id,
  ]

  admin_ssh_key {
    username   = "adminuser"
    public_key = data.azurerm_key_vault_secret.vm_ssh.value
  }

  os_disk {
    name                 = "${azurerm_linux_virtual_machine.linux_vm_01.name}-os-disk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}
