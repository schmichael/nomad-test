#!/bin/bash

set -o errexit
set -o errtrace

if [[ -z $1 ]]; then
	echo "$0 REGION"
	exit 1
fi

{
cfssl gencert -ca ca.pem -ca-key ca-key.pem - <<EOF
{
    "hosts": [
        "server.$1.nomad",
        "client.$1.nomad",
	"localhost"
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

RSYNC_OPTS="--partial --perms --times --compress --quiet"

set -o xtrace

mv cert.csr cert-$1.csr
mv cert.pem cert-$1.pem
mv cert-key.pem cert-key-$1.pem

echo "Certs for $1 created."

rsync $RSYNC_OPTS ca.pem cert*$1.pem server0.us-west1-a.calm-cairn-147722:
rsync $RSYNC_OPTS ca.pem cert*$1.pem server1.us-west1-a.calm-cairn-147722:
rsync $RSYNC_OPTS ca.pem cert*$1.pem server2.us-west1-a.calm-cairn-147722:
rsync $RSYNC_OPTS ca.pem cert*$1.pem z1client0.us-west1-a.calm-cairn-147722:
rsync $RSYNC_OPTS ca.pem cert*$1.pem z1client1.us-west1-a.calm-cairn-147722:
rsync $RSYNC_OPTS ca.pem cert*$1.pem z1client2.us-west1-a.calm-cairn-147722:
