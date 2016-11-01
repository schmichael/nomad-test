#!/bin/bash

set -o errexit

RSYNC_OPTS="--partial --perms --times --compress --quiet"

set -o xtrace

#rsync $RSYNC_OPTS ../nomad/nomad.hcl server0.us-west1-a.calm-cairn-147722:nomad.hcl
#rsync $RSYNC_OPTS ../nomad/nomad.hcl server1.us-west1-a.calm-cairn-147722:nomad.hcl
#rsync $RSYNC_OPTS ../nomad/nomad.hcl server2.us-west1-a.calm-cairn-147722:nomad.hcl
#rsync $RSYNC_OPTS ../nomad/nomad.hcl z1client0.us-west1-a.calm-cairn-147722:nomad.hcl
#rsync $RSYNC_OPTS ../nomad/nomad.hcl z1client1.us-west1-a.calm-cairn-147722:nomad.hcl
#rsync $RSYNC_OPTS ../nomad/nomad.hcl z1client2.us-west1-a.calm-cairn-147722:nomad.hcl

rsync $RSYNC_OPTS $GOPATH/bin/nomad server0.us-west1-a.calm-cairn-147722:/tmp/nomad-bin
rsync $RSYNC_OPTS $GOPATH/bin/nomad server1.us-west1-a.calm-cairn-147722:/tmp/nomad-bin
rsync $RSYNC_OPTS $GOPATH/bin/nomad server2.us-west1-a.calm-cairn-147722:/tmp/nomad-bin
rsync $RSYNC_OPTS $GOPATH/bin/nomad z1client0.us-west1-a.calm-cairn-147722:/tmp/nomad-bin
rsync $RSYNC_OPTS $GOPATH/bin/nomad z1client1.us-west1-a.calm-cairn-147722:/tmp/nomad-bin
rsync $RSYNC_OPTS $GOPATH/bin/nomad z1client2.us-west1-a.calm-cairn-147722:/tmp/nomad-bin

ssh server0.us-west1-a.calm-cairn-147722 sudo install --mode 0755 /tmp/nomad-bin /usr/local/bin/nomad
ssh server1.us-west1-a.calm-cairn-147722 sudo install --mode 0755 /tmp/nomad-bin /usr/local/bin/nomad
ssh server2.us-west1-a.calm-cairn-147722 sudo install --mode 0755 /tmp/nomad-bin /usr/local/bin/nomad
ssh z1client0.us-west1-a.calm-cairn-147722 sudo install --mode 0755 /tmp/nomad-bin /usr/local/bin/nomad
ssh z1client1.us-west1-a.calm-cairn-147722 sudo install --mode 0755 /tmp/nomad-bin /usr/local/bin/nomad
ssh z1client2.us-west1-a.calm-cairn-147722 sudo install --mode 0755 /tmp/nomad-bin /usr/local/bin/nomad
