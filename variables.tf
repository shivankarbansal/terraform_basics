variable "project" {}
variable "credentials_file" {}

variable "region" {
    default = "us-west1"
}

variable "zone" {
    default = "us-west1-a"
}

variable "os_image" {
    default = "debian-cloud/debian-9"
}

variable "vm_params" {
    type = tuple([string, string, bool])
    description = "paramters for vm instance"
    default = ["f1-micro", "us-west1-a", true]
}

variable "vm_parameters" {
    type = object({
    name = string
    machine_type = string
    zone = string
    allow_stopping_for_update = bool
    })
    description = "vm parameters in object format"
    default = {
    name = "terraform-instance"
    machine_type = "f1-micro"
    zone = "us-west1-a"
    allow_stopping_for_update = true
    }
    validation {
        condition = length(var.vm_parameters.name) > 3
        error_message = "Vm name should be atleast 4 characters"
    }
}