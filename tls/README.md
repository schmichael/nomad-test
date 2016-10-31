Generated using cfssl

After creating cluter using terraform run:

```sh
./mkcert.sh server0.whatever.internal server0.something.else
```

This generates a certificate with those two names and uploads it to the second
name. The upload relies upon `gcloud compute config-ssh` being run.
