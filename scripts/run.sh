#!/bin/bash

set -o errexit

RSYNC_OPTS="--partial --perms --times --compress --quiet"

set -o xtrace

ssh server0.us-west1-a.calm-cairn-147722 "$@"
ssh server1.us-west1-a.calm-cairn-147722 "$@"
ssh server2.us-west1-a.calm-cairn-147722 "$@"
ssh z1client0.us-west1-a.calm-cairn-147722 "$@"
ssh z1client1.us-west1-a.calm-cairn-147722 "$@"
ssh z1client2.us-west1-a.calm-cairn-147722 "$@"
