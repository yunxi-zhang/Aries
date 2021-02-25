#!/bin/bash

#this file assumes a von dev network is running in another vm. So this holder agent is its own vm.
#$1 is the vm's ip for this holder agent.
#$2 is the vm's ip for the von dev network.
#$3 is the tails file server's ngrok https url

echo "vm's ip for this holder agent is: $1"
echo "vm's ip for the von dev network is: $2"
echo "tails file server's ngrok https url is: $3"

PORTS="8000:8000 8001:8001" \
./run_docker start \
-l Holder \
-it http 0.0.0.0 8000 \
-ot http \
--admin 0.0.0.0 8001 \
--admin-insecure-mode \
-e http://$1:8000/ \
--genesis-url http://$2:9000/genesis \
--wallet-type indy \
--wallet-name holderwallet \
--wallet-key holderkey \
--seed holder00000000000000000000000000  \
--log-level 'info'  \
--auto-provision \
--auto-accept-invites \
--auto-accept-requests \
--auto-respond-messages \
--auto-ping-connection \
--tails-server-base-url $2