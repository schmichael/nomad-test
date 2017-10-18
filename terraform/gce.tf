provider "google" {
	project = "nomad-dev-181118"
	region  = "us-west-1"
}

resource "google_compute_instance" "nomad-servers" {
  name         = "schm-server-${count.index}"
  machine_type = "n1-standard-1"
  zone         = "us-west1-b"
  count        = 1

  tags = ["nomad", "nomad-server"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }
}

resource "google_compute_instance" "nomad-clients" {
  name         = "schm-client-${count.index}"
  machine_type = "n1-standard-1"
  zone         = "us-west1-b"
  count        = 3

  tags = ["nomad", "nomad-client"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }
}
