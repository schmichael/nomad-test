#!/bin/bash

set -o errexit

scp cert-c.calm-cairn-147722.internal.pem server0.us-west1-a.calm-cairn-147722:/tmp/cert.pem
scp cert-key-c.calm-cairn-147722.internal.pem server0.us-west1-a.calm-cairn-147722:/tmp/cert-key.pem
scp cert-c.calm-cairn-147722.internal.pem server1.us-west1-a.calm-cairn-147722:/tmp/cert.pem
scp cert-key-c.calm-cairn-147722.internal.pem server1.us-west1-a.calm-cairn-147722:/tmp/cert-key.pem
scp cert-c.calm-cairn-147722.internal.pem server2.us-west1-a.calm-cairn-147722:/tmp/cert.pem
scp cert-key-c.calm-cairn-147722.internal.pem server2.us-west1-a.calm-cairn-147722:/tmp/cert-key.pem

scp cert-c.calm-cairn-147722.internal.pem z1client0.us-west1-a.calm-cairn-147722:/tmp/cert.pem
scp cert-key-c.calm-cairn-147722.internal.pem z1client0.us-west1-a.calm-cairn-147722:/tmp/cert-key.pem
scp cert-c.calm-cairn-147722.internal.pem z1client1.us-west1-a.calm-cairn-147722:/tmp/cert.pem
scp cert-key-c.calm-cairn-147722.internal.pem z1client1.us-west1-a.calm-cairn-147722:/tmp/cert-key.pem
scp cert-c.calm-cairn-147722.internal.pem z1client2.us-west1-a.calm-cairn-147722:/tmp/cert.pem
scp cert-key-c.calm-cairn-147722.internal.pem z1client2.us-west1-a.calm-cairn-147722:/tmp/cert-key.pem
