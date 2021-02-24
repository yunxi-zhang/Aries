#!/bin/bash

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
--auto-ping-connection