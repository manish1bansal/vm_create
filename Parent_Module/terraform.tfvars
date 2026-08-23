rgs = {
  rg1 = {
    rgname   = "mango"
    location = "southindia"
  }
}

stg = {
  stg = {
    stgname                  = "mangostorage785"
    location                 = "southindia"
    rgname                   = "mango"
    account_replication_type = "LRS"
    account_tier             = "Standard"
  }
}

vnets = {
  vnet1 = {
    vnetname      = "mango_vnet"
    location      = "southindia"
    rgname        = "mango"
    address_space = ["10.0.0.0/16"]
  }
}
sbnet = {
  sbnet1 = {
    sbnetname        = "mango_sbnet"
    rgname           = "mango"
    vnetname         = "mango_vnet"
    address_prefixes = ["10.0.1.0/24"]
  }
}

vms = {
  vm1 = {
    vmname         = "mangovm"
    location       = "southindia"
    rgname         = "mango"
    size           = "Standard_D2s_v3"
    admin_username = "adminuser"
    admin_password = "Admin@123456"
    nicname        = "mango_nic"
    ipname         = "mango_internal"
  }
  vm2 = {
    vmname         = "tangovm"
    location       = "southindia"
    rgname         = "mango"
    size           = "Standard_D2s_v3"
    admin_username = "adminuser"
    admin_password = "Admin@123456"
    nicname        = "tango_nic"
    ipname         = "tango_internal"
  }
}