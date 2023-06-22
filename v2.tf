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
        network = google_compute_network.terraform_network.self_link
        subnetwork = google_compute_subnetwork.terraform_subnet.self_link
        access_config {
          //necessary even empty
          //ensures that instance will be accessible over the internet
        }
    }
}

resource "google_compute_network" "terraform_network" {
    name = "terraform-network"
    auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "terraform_subnet" {
    name = "terraform-subnetwork"
    ip_cidr_range = "10.20.0.0/16"
    region  = "<us-region>"
    network = google_compute_network.terraform_network.id
}
//example of creating compute instance on compute engine custom vpc and network settings