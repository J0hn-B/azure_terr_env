# resource "azurerm_network_interface" "vm_nic_01" {
#   name                = "vm-nic-01"
#   location            = var.rg_linux_vm_location
#   resource_group_name = var.rg_linux_vm_name

#   ip_configuration {
#     name                          = "internal"
#     subnet_id                     = azurerm_subnet.azure_cni_02.id
#     private_ip_address_allocation = "Dynamic"
#   }
# }

# resource "azurerm_linux_virtual_machine" "linux_vm_01" {
#   name                = var.linux_vm_01_name
#   resource_group_name = var.rg_linux_vm_name
#   location            = var.rg_linux_vm_location
#   size                = "Standard_B2s"
#   admin_username      = "adminuser"
#   network_interface_ids = [
#     azurerm_network_interface.vm_nic_01.id,
#   ]

#   admin_ssh_key {
#     username   = "adminuser"
#     public_key = data.azurerm_key_vault_secret.vm_ssh.value
#   }

#   os_disk {
#     caching              = "ReadWrite"
#     storage_account_type = "Standard_LRS"
#   }

#   source_image_reference {
#     publisher = "Canonical"
#     offer     = "UbuntuServer"
#     sku       = "18.04-LTS"
#     version   = "latest"
#   }
# }
