#!/bin/bash
set -e
n=1 ; eval a$n="54.169.181.172";
n=2 ; eval a$n="13.250.35.59";
n=3 ; eval a$n="13.229.233.128";
n=4 ; eval a$n="54.179.143.121";

for i in 1 2 3 4
do
    eval ip=\$a$i
    echo ${ip}
    #R=$(( $i - 1 ))
    #scp -i /home/datlv/Documents/deevo/key/dev-full-rights.pem -r /home/datlv/Documents/deevo/configproduction/* ubuntu@${ip}:/home/ubuntu/hyperledgerconfig/data/
done
ssh -p 22 -i /home/datlv/Documents/deevo/key/dev-full-rights.pem ubuntu@54.169.181.172 'if [ $(pidof java) ] ; then kill $(pidof java) ; fi; cd /opt/gopath/src/github.com/deevotech/sc-network.deevo.io/scripts-1.2; ./start-replica.sh -g replicas -n 0; exit;'
ssh -p 22 -i /home/datlv/Documents/deevo/key/dev-full-rights.pem ubuntu@13.250.35.59 'if [ $(pidof java) ] ; then kill $(pidof java) ; fi; cd /opt/gopath/src/github.com/deevotech/sc-network.deevo.io/scripts-1.2; ./start-replica.sh -g replicas -n 1; exit;'
ssh -p 22 -i /home/datlv/Documents/deevo/key/dev-full-rights.pem ubuntu@13.229.233.128 'if [ $(pidof java) ] ; then kill $(pidof java) ; fi; cd /opt/gopath/src/github.com/deevotech/sc-network.deevo.io/scripts-1.2; ./start-replica.sh -g replicas -n 2; exit;'
ssh -p 22 -i /home/datlv/Documents/deevo/key/dev-full-rights.pem ubuntu@54.179.143.121 'if [ $(pidof java) ] ; then kill $(pidof java) ; fi; cd /opt/gopath/src/github.com/deevotech/sc-network.deevo.io/scripts-1.2; ./start-replica.sh -g replicas -n 3; exit;'

