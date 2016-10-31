#!/bin/bash

set -o errexit
set -o errtrace

if [[ -z $1 || -z $2 ]]; then
	echo "$0 INTERNAL_HOSTNAME EXTERNAL_HOSTNAME"
	exit 1
fi

{
cfssl gencert -ca ca.pem -ca-key ca-key.pem - <<EOF
{
    "hosts": [
        "$1",
	"$2"
    ],
    "key": {
        "algo": "rsa",
        "size": 2048
    },
    "names": [
        {
            "C": "US",
            "L": "San Francisco",
            "O": "Internet Widgets, Inc.",
            "OU": "WWW",
            "ST": "California"
        }
    ]
}
EOF
} | cfssljson -bare

set -o xtrace

mv cert.csr cert-$1.csr
mv cert.pem cert-$1.pem
mv cert-key.pem cert-key-$1.pem

echo "Certs for $1 created. scp'ing to $2:/tmp/cert.pem ..."

scp ca.pem $2:/tmp/ca.pem
scp cert-$1.pem $2:/tmp/cert.pem
scp cert-key-$1.pem $2:/tmp/cert-key.pem
