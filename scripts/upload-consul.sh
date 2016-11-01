#!/bin/bash

set -o errexit

RSYNC_OPTS="--partial --perms --times --compress --quiet -L"

set -o xtrace

rsync $RSYNC_OPTS $HOME/bin/consul server0.us-west1-a.calm-cairn-147722:/tmp/consul-bin
rsync $RSYNC_OPTS $HOME/bin/consul server1.us-west1-a.calm-cairn-147722:/tmp/consul-bin
rsync $RSYNC_OPTS $HOME/bin/consul server2.us-west1-a.calm-cairn-147722:/tmp/consul-bin
rsync $RSYNC_OPTS $HOME/bin/consul z1client0.us-west1-a.calm-cairn-147722:/tmp/consul-bin
rsync $RSYNC_OPTS $HOME/bin/consul z1client1.us-west1-a.calm-cairn-147722:/tmp/consul-bin
rsync $RSYNC_OPTS $HOME/bin/consul z1client2.us-west1-a.calm-cairn-147722:/tmp/consul-bin

ssh server0.us-west1-a.calm-cairn-147722 sudo install --mode 0755 /tmp/consul-bin /usr/local/bin/consul
ssh server1.us-west1-a.calm-cairn-147722 sudo install --mode 0755 /tmp/consul-bin /usr/local/bin/consul
ssh server2.us-west1-a.calm-cairn-147722 sudo install --mode 0755 /tmp/consul-bin /usr/local/bin/consul
ssh z1client0.us-west1-a.calm-cairn-147722 sudo install --mode 0755 /tmp/consul-bin /usr/local/bin/consul
ssh z1client1.us-west1-a.calm-cairn-147722 sudo install --mode 0755 /tmp/consul-bin /usr/local/bin/consul
ssh z1client2.us-west1-a.calm-cairn-147722 sudo install --mode 0755 /tmp/consul-bin /usr/local/bin/consul
