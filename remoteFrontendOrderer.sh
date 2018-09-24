#!/bin/bash
ssh -p 22 -i /home/datlv/Documents/deevo/key/dev-full-rights.pem ubuntu@54.169.140.0 'if [ $(pidof java) ] ; then kill $(pidof java orderer) ; fi; cd /opt/gopath/src/github.com/hyperledger/hyperledger-bftsmart-orderering; ./RunFrontend.sh; sleep 5; cd /opt/gopath/src/github.com/deevotech/supply-chain-network/scripts; ./start-orderer.sh -g org0 -n 0; exit '
