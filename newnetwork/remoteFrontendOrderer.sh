#!/bin/bash
ssh -p 22 -i /home/datlv/Documents/deevo/key/dev-full-rights.pem ubuntu@18.136.126.89 'if [ $(pidof java) ] ; then kill $(pidof java orderer) ; fi; cd /opt/gopath/src/github.com/deevotech/sc-network.deevo.io/scripts-1.2; ./start-frontend.sh -g replicas; sleep 10; ./start-orderer.sh -g org0 -n 0; exit; '
