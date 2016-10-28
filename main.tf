## VARIABLES

variable "region1" {
  type    = "string"
  default = "us-west1"
}

variable "r1zone1" {
  type    = "string"
  default = "us-west1-a"
}

variable "r1zone2" {
  type    = "string"
  default = "us-west1-b"
}

variable "image" {
  type    = "string"
  default = "debian-cloud/debian-8"
}

variable "public_key_path" {
  type    = "string"
  default = "~/.ssh/id_rsa.pub"
}

## PROVIDER

provider "google" {
  region  = "${var.region1}"
  project = "calm-cairn-147722"

  credentials = "${file("credentials.json")}"
}

## NETWORK

#resource "google_compute_network" "default" {
#  name = "default"
#}

## SERVERS

resource "google_compute_instance" "z1server" {
  name  = "z1server${count.index}"
  zone  = "${var.r1zone1}"
  count = 2

  tags = ["server"]

  disk {
    image = "${var.image}"
  }

  network_interface {
    network       = "default"
    access_config = {}
  }

  machine_type = "n1-standard-2"

  metadata {
    ssh-keys = "debian:${file("${var.public_key_path}")}"
  }
}

resource "google_compute_instance" "z2server" {
  name  = "z2server${count.index}"
  zone  = "${var.r1zone2}"
  count = 1

  tags = ["server"]

  disk {
    image = "${var.image}"
  }

  network_interface {
    network       = "default"
    access_config = {}
  }

  machine_type = "n1-standard-2"

  metadata {
    ssh-keys = "debian:${file("${var.public_key_path}")}"
  }
}

## CLIENTS

resource "google_compute_instance" "z1client" {
  name  = "z1client${count.index}"
  zone  = "${var.r1zone1}"
  count = 2

  tags = ["client"]

  disk {
    image = "${var.image}"
  }

  network_interface {
    network       = "default"
    access_config = {}
  }

  machine_type = "n1-standard-2"

  metadata {
    ssh-keys = "debian:${file("${var.public_key_path}")}"
  }
}

resource "google_compute_instance" "z2client" {
  name  = "z2client${count.index}"
  zone  = "${var.r1zone2}"
  count = 2

  tags = ["client"]

  disk {
    image = "${var.image}"
  }

  network_interface {
    network       = "default"
    access_config = {}
  }

  machine_type = "n1-standard-2"

  metadata {
    ssh-keys = "debian:${file("${var.public_key_path}")}"
  }
}
