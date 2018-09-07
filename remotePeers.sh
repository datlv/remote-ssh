#!/bin/bash
set -e

n=1 ; eval a$n="54.255.236.246"
n=2 ; eval a$n="18.136.105.95"
n=3 ; eval a$n="18.136.104.14"
n=4 ; eval a$n="13.250.112.83"
n=5 ; eval a$n="52.221.181.66"

ssh -p 22 -i /home/datlv/Documents/deevo/key/dev-full-rights.pem ubuntu@54.255.236.246 'sudo mkdir -p /var/hyperledger; sudo chmod 777 -R /var/hyperledger/; if [ $(pidof peer) ] ; then kill $(pidof peer) ; fi; cd /opt/gopath/src/github.com/deevotech/supply-chain-network/scripts; git pull;  ./start-peer.sh -g org1 -n 0; exit;'
ssh -p 22 -i /home/datlv/Documents/deevo/key/dev-full-rights.pem ubuntu@18.136.105.95 'sudo mkdir -p /var/hyperledger; sudo chmod 777 -R /var/hyperledger/; if [ $(pidof peer) ] ; then kill $(pidof peer) ; fi; cd /opt/gopath/src/github.com/deevotech/supply-chain-network/scripts; git pull;  ./start-peer.sh -g org2 -n 0; exit;'
ssh -p 22 -i /home/datlv/Documents/deevo/key/dev-full-rights.pem ubuntu@18.136.104.14 'sudo mkdir -p /var/hyperledger; sudo chmod 777 -R /var/hyperledger/; if [ $(pidof peer) ] ; then kill $(pidof peer) ; fi; cd /opt/gopath/src/github.com/deevotech/supply-chain-network/scripts; git pull;  ./start-peer.sh -g org3 -n 0; exit;'
ssh -p 22 -i /home/datlv/Documents/deevo/key/dev-full-rights.pem ubuntu@13.250.112.83 'sudo mkdir -p /var/hyperledger; sudo chmod 777 -R /var/hyperledger/; if [ $(pidof peer) ] ; then kill $(pidof peer) ; fi; cd /opt/gopath/src/github.com/deevotech/supply-chain-network/scripts; git pull;  ./start-peer.sh -g org4 -n 0; exit;'
ssh -p 22 -i /home/datlv/Documents/deevo/key/dev-full-rights.pem ubuntu@52.221.181.66 'sudo mkdir -p /var/hyperledger; sudo chmod 777 -R /var/hyperledger/; if [ $(pidof peer) ] ; then kill $(pidof peer) ; fi; cd /opt/gopath/src/github.com/deevotech/supply-chain-network/scripts; git pull;  ./start-peer.sh -g org5 -n 0; exit;'

