#!/bin/bash
set -o errexit
set -o xtrace

# dnsmasq

sudo apt install -yqq dnsmasq
sudo install -vp --mode=0644 /tmp/dnsmasq.conf /etc/dnsmasq.d/10-consul

# consul
sudo install -vp --mode=0755 /tmp/consul /usr/local/bin/consul
sudo install -vp --mode=0644 /tmp/consul.service /etc/systemd/system/consul.service
sudo install -vp --mode=0644 /tmp/consul.json /etc/consul.json

# nomad

sudo install -vp --mode=0755 /tmp/nomad  /usr/local/bin/nomad
sudo install -vp --mode=0644 /tmp/nomad.service /etc/systemd/system/nomad.service
sudo install -vp --mode=0644 /tmp/nomad.hcl /etc/nomad.hcl

# vault

sudo install -vp --mode=0755 /tmp/vault  /usr/local/bin/vault
sudo install -vp --mode=0644 /tmp/vault.service /etc/systemd/system/vault.service
sudo install -vp --mode=0644 /tmp/vault.hcl /etc/vault.hcl
