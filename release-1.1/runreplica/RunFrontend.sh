#!/bin/bash
mkdir -p data
mkdir -p data/logs
if [ -f ./data/logs/frontend.out ] ; then
rm ./data/logs/frontend.out
fi
/opt/gopath/src/github.com/hyperledger/hyperledger-bftsmart-orderering/startFrontend.sh 1000 20 9999 > data/logs/frontend.out 2>&1 &
echo "success frontend"
