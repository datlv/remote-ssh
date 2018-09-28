#!/bin/bash
echo "stop network and sleep 10 ..."
./stopNetwork.sh
sleep 10
echo "Run fabric ca server sleep 10 ..."
./remoteCagenares.sh
sleep 10
echo "Getconfig and sleep 10 ..."
./remoteGetConfig.sh
sleep 10
echo "Generate genesis and sleep 10 ..."
./remoteGenesis.sh
sleep 10
echo "start replica sleep 15 ..."
./remoteReplicas.sh
sleep 15
echo "start frontend sleep 15 ..."
./remoteFrontendOrderer.sh
sleep 15
echo "start peers sleep 15 ..."
./remotePeers.sh
sleep 15
echo "install channel sleep 10 ..."
./remote-install-channel.sh
sleep 10
echo "install chaincode caliper test sleep 10 ..."
./remote-install-chaincode.sh
sleep 10
echo "Copy config to caliper config folder and sleep 10 ..."
./generate-caliper-config.sh
sleep 10
echo "done..."