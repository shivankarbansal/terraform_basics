provider "google" {
    project = var.project
    credentials = file(var.credentials_file)
    region = var.region
    zone = var.zone
}

resource "google_compute_instance" "my_instance" {
    name = var.vm_parameters.name
    machine_type = var.vm_parameters.machine_type
    zone = var.vm_parameters.zone
    allow_stopping_for_update = var.vm_parameters.allow_stopping_for_update

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