#!/bin/bash
set -e

n=1 ; eval a$n="13.229.67.40"
n=2 ; eval a$n="13.250.109.169"
n=3 ; eval a$n="13.229.125.149"
n=4 ; eval a$n="54.179.181.86"
n=5 ; eval a$n="54.254.189.216"
n=6 ; eval a$n="18.136.126.89"
n=7 ; eval a$n="54.179.185.222"

mkdir -p /home/datlv/Documents/deevo/configproduction/
rm -rf /home/datlv/Documents/deevo/configproduction/*
## fabric ca for org1
ssh -p 22 -i /home/datlv/Documents/deevo/key/dev-full-rights.pem ubuntu@13.229.67.40 'if [ $(pidof fabric-ca-server) ] ; then kill $(pidof fabric-ca-server) ; fi; cd /opt/gopath/src/github.com/deevotech/sc-network.deevo.io/scripts-1.2/; ./start-root-ca.sh -g org1 -r 0; sleep 5; ./generate-peer-tls.sh -g org1 -n 0; exit ;'
ssh -p 22 -i /home/datlv/Documents/deevo/key/dev-full-rights.pem ubuntu@13.250.109.169 'if [ $(pidof fabric-ca-server) ] ; then kill $(pidof fabric-ca-server) ; fi; cd /opt/gopath/src/github.com/deevotech/sc-network.deevo.io/scripts-1.2/; ./start-root-ca.sh -g org2 -r 0; sleep 5;  ./generate-peer-tls.sh -g org2 -n 0; exit ;'
ssh -p 22 -i /home/datlv/Documents/deevo/key/dev-full-rights.pem ubuntu@13.229.125.149 'if [ $(pidof fabric-ca-server) ] ; then kill $(pidof fabric-ca-server) ; fi; cd /opt/gopath/src/github.com/deevotech/sc-network.deevo.io/scripts-1.2/; ./start-root-ca.sh -g org3 -r 0; sleep 5; ./generate-peer-tls.sh -g org3 -n 0; exit ;'
ssh -p 22 -i /home/datlv/Documents/deevo/key/dev-full-rights.pem ubuntu@54.179.181.86 'if [ $(pidof fabric-ca-server) ] ; then kill $(pidof fabric-ca-server) ; fi; cd /opt/gopath/src/github.com/deevotech/sc-network.deevo.io/scripts-1.2/; ./start-root-ca.sh -g org4 -r 0; sleep 5; ./generate-peer-tls.sh -g org4 -n 0; exit;'
ssh -p 22 -i /home/datlv/Documents/deevo/key/dev-full-rights.pem ubuntu@54.254.189.216 'if [ $(pidof fabric-ca-server) ] ; then kill $(pidof fabric-ca-server) ; fi; cd /opt/gopath/src/github.com/deevotech/sc-network.deevo.io/scripts-1.2/; ./start-root-ca.sh -g org5 -r 0; sleep 5; ./generate-peer-tls.sh -g org5 -n 0; exit;'
ssh -p 22 -i /home/datlv/Documents/deevo/key/dev-full-rights.pem ubuntu@18.136.126.89 'if [ $(pidof fabric-ca-server) ] ; then kill $(pidof fabric-ca-server) ; fi; cd /opt/gopath/src/github.com/deevotech/sc-network.deevo.io/scripts-1.2/; ./start-root-ca.sh -g org0 -r 0; sleep 5; ./generate-orderer-tls.sh -g org0 -n 0; exit;'
ssh -p 22 -i /home/datlv/Documents/deevo/key/dev-full-rights.pem ubuntu@54.169.181.172 'if [ $(pidof fabric-ca-server) ] ; then kill $(pidof fabric-ca-server) ; fi; cd /opt/gopath/src/github.com/deevotech/sc-network.deevo.io/scripts-1.2/; ./start-root-ca.sh -g replicas -r 0; sleep 5; exit;'
scp -i /home/datlv/Documents/deevo/key/dev-full-rights.pem -r  ubuntu@54.169.181.172:/home/ubuntu/hyperledgerconfig/data/* /home/datlv/Documents/deevo/configproduction/
scp -i /home/datlv/Documents/deevo/key/dev-full-rights.pem -r /home/datlv/Documents/deevo/configproduction/ca/* ubuntu@18.136.126.89:/home/ubuntu/hyperledgerconfig/data/ca/
ssh -p 22 -i /home/datlv/Documents/deevo/key/dev-full-rights.pem ubuntu@18.136.126.89 ' cd /opt/gopath/src/github.com/deevotech/sc-network.deevo.io/scripts-1.2/; sleep 5; ./generate-replicas-tls.sh -g replicas -n 4 -d /home/ubuntu/hyperledgerconfig/data/orgs/org0/orderer0.org0.deevo.io/tls ; exit;'

