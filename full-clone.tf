#
# Proxmox Full-Clone
# ---
# Create a new VM from a clone

resource "proxmox_vm_qemu" "test-deployment" {
    
   # VM General Settings
   target_node = "pve1"
   vmid = "8000"
   name = "test-vm"
   desc = "Test Description"
   
   disk {
    storage = "truenas-nfs"
    size = "32G"
    type = "scsi"
    ssd = 1
    discard = "on"
    iothread = 1
   }

   # VM OS Settings
   clone = "ubuntu-s-2204"

   # VM System Settings
   agent = 1
   os_type = "cloud-init"
   cores = 2
   sockets = 1
   cpu = "host"    
   memory = 1024

   #VM Display Settings
   vga {
       type = "serial0"
   }

   # VM Disk Settings

   # VM Network Settings
   network {
       bridge = "vmbr0"
       model  = "virtio"
   }
}
