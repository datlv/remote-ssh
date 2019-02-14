#!/bin/bash
mkdir -p data
mkdir -p data/logs
if [ -f ./config/currentView ] ; then
rm ./config/currentView
fi
/opt/gopath/src/github.com/hyperledger/hyperledger-bftsmart-orderering/startReplica.sh 5 > data/logs/replica-5.success 2>&1 &
