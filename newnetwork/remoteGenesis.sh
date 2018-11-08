#!/bin/bash
ssh -p 22 -i /home/datlv/Documents/deevo/key/dev-full-rights.pem ubuntu@18.136.126.89 ' rm -rf /home/ubuntu/hyperledgerconfig/data/*; exit; '

scp -i /home/datlv/Documents/deevo/key/dev-full-rights.pem -r /home/datlv/Documents/deevo/configproduction/* ubuntu@18.136.126.89:/home/ubuntu/hyperledgerconfig/data/
ssh -p 22 -i /home/datlv/Documents/deevo/key/dev-full-rights.pem ubuntu@18.136.126.89 ' cd /opt/gopath/src/github.com/deevotech/sc-network.deevo.io/scripts-1.2; ./generate-configtx.sh -o "org0" -r "replicas" -g "org1 org2 org3 org4 org5";./generate-genesis.sh; exit; '
sleep 5;
scp -i /home/datlv/Documents/deevo/key/dev-full-rights.pem ubuntu@18.136.126.89:/home/ubuntu/hyperledgerconfig/data/genesis.block /home/datlv/Documents/deevo/configproduction/genesis.block


