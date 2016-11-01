data_dir = "/tmp/nomaddata"

enable_debug = true

log_level = "DEBUG"

bind_addr = "0.0.0.0"

tls {
  rpc       = true
  http      = true
  ca_file   = "/tmp/ca.pem"
  cert_file = "/tmp/cert.pem"
  key_file  = "/tmp/cert-key.pem"
}
