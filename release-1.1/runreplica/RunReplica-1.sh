#!/bin/bash
mkdir -p data
mkdir -p data/logs
if [ -f ./config/currentView ] ; then
rm ./config/currentView
fi
/opt/gopath/src/github.com/hyperledger/hyperledger-bftsmart-orderering/startReplica.sh 1 > data/logs/replica-1.success 2>&1 &
