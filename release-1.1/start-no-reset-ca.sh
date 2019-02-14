#!/bin/bash
echo "stop network and sleep 10 ..."
./stopNetwork.sh
sleep 10
echo "start replica sleep 15 ..."
./remoteReplica.sh
sleep 15
echo "start replica sleep 15 ..."
./remoteFrontendOrderer.sh
sleep 15
echo "start replica sleep 15 ..."
./remotePeers.sh
sleep 15
echo "start replica sleep 10 ..."
./remote-install-channel.sh
sleep 10
echo "start replica sleep 10 ..."
./remote-install-chaincode.sh
sleep 10
echo "Copy config to caliper config folder and sleep 10 ..."
./generate-caliper-config.sh
sleep 10
echo "done..."

