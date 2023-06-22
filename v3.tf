provider "google" {
    project = var.project
    credentials = file(var.credentials_file)
    region = var.region
    zone = var.zone
}

resource "google_compute_instance" "my_instance" {
    name = "terraform-instance"
    machine_type = var.vm_params[0]
    zone = var.vm_params[1]
    allow_stopping_for_update = var.vm_params[2]

    boot_disk {
        initialize_params {
        image = var.os_image
        }
    }
    network_interface {
        network = "default"
        access_config {
        //necessary even empty
        //ensures that instance will be accessible over the internet
        }
    }
}