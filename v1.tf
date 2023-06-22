provider "google" {
    project = "<project_id>"
    credentials = file("credentials.json")
    region = "<us-region>"
    zone = "<us-zone>"
}

resource "google_compute_instance" "my_instance" {
    name = "terraform-instance"
    machine_type = "f1-micro"
    zone = "<us-zone>"
    allow_stopping_for_update = true

    boot_disk {
        initialize_params {
        image = "debian-cloud/debian-9"
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
//example of creating compute instance on compute engine on default vpc and network settings