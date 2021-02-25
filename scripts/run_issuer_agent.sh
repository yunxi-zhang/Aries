#!/bin/bash

#this file assumes a von dev network and an issuer agent will run in the same vm.
#$1 is the vm's ip.
#$2 is the tails file server's ngrok https url

echo "vm's ip is: $1"
echo "tails file server's ngrok https url is: $2"

PORTS="8000:8000 8001:8001" \
./run_docker start \
-l Issuer \
-it http 0.0.0.0 8000 \
-ot http \
--admin 0.0.0.0 8001 \
--admin-insecure-mode \
-e http://$1:8000/ \
--genesis-url http://$1:9000/genesis \
--wallet-type indy \
--wallet-name issuerwallet \
--wallet-key issuerkey \
--seed issuer00000000000000000000000000  \
--log-level 'info' \
--auto-provision \
--auto-accept-invites \
--auto-accept-requests \
--auto-respond-messages \
--auto-ping-connection \
--tails-server-base-url $2