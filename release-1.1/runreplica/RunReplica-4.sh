#!/bin/bash
mkdir -p data
mkdir -p data/logs
if [ -f ./config/currentView ] ; then
rm ./config/currentView
fi
/opt/gopath/src/github.com/hyperledger/hyperledger-bftsmart-orderering/startReplica.sh 4 > data/logs/replica-4.success 2>&1 &
