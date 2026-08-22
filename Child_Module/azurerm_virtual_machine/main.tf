resource "azurerm_linux_virtual_machine" "vms" {
  for_each = var.vms
  name = each.value.vmname
  location = each.value.location
  resource_group_name = each.value.rgname
  network_interface_ids = [azurerm_network_interface.nic[each.key].id]
  size = each.value.size
  admin_username = each.value.admin_username
  admin_password = each.value.admin_password
  disable_password_authentication = "false"

    os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}


resource "azurerm_network_interface" "nic" {
    for_each = var.vms
    name = each.value.nicname
    location = each.value.location
    resource_group_name = each.value.rgname
    ip_configuration {
      name = each.value.ipname
      subnet_id = var.subnet_id["sbnet1"]
      private_ip_address_allocation = "Dynamic"
    }
}
variable "vms" {}

variable "subnet_id" {}