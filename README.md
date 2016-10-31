wip test harness for nomad

Everything is tailored for GCE. Use `gcloud compute config-ssh` to generate a
`~/.ssh/google_compute_engine` ssh keypair.

* consul/ - consul configs
* nomad/ - nomad configs
* packer/ - wip packer builder for gce image
* terraform/ - `terraform apply` will create 3 client vms and 3 server vms
* tls/ - test certificates and scripts
