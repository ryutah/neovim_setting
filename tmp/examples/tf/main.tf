terraform {
  required_version = "~> 1.5.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.82.0"
    }
  }
}

resource "google_compute_network" "vpc_network" {
  name                    = "terraform-network"
  auto_create_subnetworks = "true"
}
resource "google_compute_instance" "gce_test" {
  network_interface {
    network = "default"
  }
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }
  project      = "testest"
  name         = "testtest-gce001"
  zone         = "asia-northeast1-a"
  machine_type = "n2-standard-200"
}
