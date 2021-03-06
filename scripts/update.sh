#!/bin/bash

echo "[*] Updating base code"
cd ~/alastria-node && git pull

mapfile -t NODE_TYPE <~/alastria/data/NODE_TYPE
echo "[*] Updating static-nodes" 
cp ~/alastria-node/data/static-nodes.json ~/alastria/data/static-nodes.json
echo "[*] Updating permissioned-nodes" 
cp ~/alastria-node/data/permissioned-nodes_$NODE_TYPE.json ~/alastria/data/permissioned-nodes.json

echo "[*] Restarting node" 
~/alastria-node/scripts/stop.sh
~/alastria-node/scripts/start.sh
