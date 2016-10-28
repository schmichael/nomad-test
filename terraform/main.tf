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
  default = "~/.ssh/google_compute_engine"
}

variable "user" {
  type    = "string"
  default = "root"
}

## PROVIDER

provider "google" {
  region  = "${var.region1}"
  project = "calm-cairn-147722"

  credentials = "${file("credentials.json")}"
}

## SERVERS

resource "google_compute_instance" "server" {
  name  = "server${count.index}"
  zone  = "${var.r1zone1}"
  count = 3

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
    ssh-keys = "${var.user}:${file("${var.public_key_path}")}"
  }

  connection {
    type        = "ssh"
    user        = "${var.user}"
    private_key = "${file("~/.ssh/google_compute_engine")}"
  }

  # Consul
  provisioner "file" {
    source      = "consul/consul.service"
    destination = "/etc/systemd/system/consul.service"
  }

  provisioner "file" {
    source      = "consul/consul.server.json"
    destination = "/etc/consul.hcl"
  }

  provisioner "file" {
    source      = "~/bin/consul"
    destination = "/usr/local/bin/consul"
  }

  provisioner "file" {
    source      = "consul/dnsmasq.conf"
    destination = "/etc/dnsmasq.d/10-consul"
  }

  # Nomad
  provisioner "file" {
    source      = "~/bin/nomad"
    destination = "/usr/local/bin/nomad"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get install -yqq dnsmasq",
    ]
  }
}

## CLIENTS

resource "google_compute_instance" "z1client" {
  name  = "z1client${count.index}"
  zone  = "${var.r1zone1}"
  count = 3

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
    ssh-keys = "${var.user}:${file("${var.public_key_path}")}"
  }

  connection {
    type        = "ssh"
    user        = "${var.user}"
    private_key = "${file("~/.ssh/google_compute_engine")}"
  }

  # Consul
  provisioner "file" {
    source      = "consul/consul.service"
    destination = "/etc/systemd/system/consul.service"
  }

  provisioner "file" {
    source      = "consul/consul.client.json"
    destination = "/etc/consul.hcl"
  }

  provisioner "file" {
    source      = "~/bin/consul"
    destination = "/usr/local/bin/consul"
  }

  provisioner "file" {
    source      = "consul/dnsmasq.conf"
    destination = "/etc/dnsmasq.d/10-consul"
  }

  # Nomad
  provisioner "file" {
    source      = "~/bin/nomad"
    destination = "/usr/local/bin/nomad"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get install -yqq dnsmasq",
    ]
  }
}