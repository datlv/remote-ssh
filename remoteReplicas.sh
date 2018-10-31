#!/bin/bash
set -e
n=1 ; eval a$n="13.229.71.175"
n=2 ; eval a$n="54.255.205.146"
n=3 ; eval a$n="54.179.187.79"
n=4 ; eval a$n="54.255.236.246"
n=5 ; eval a$n="18.136.105.95"
n=6 ; eval a$n="18.136.104.14"
n=7 ; eval a$n="13.250.112.83"
n=8 ; eval a$n="52.221.181.66"
n=9 ; eval a$n="54.169.140.0"

for i in 1 2 3 4
do
    eval ip=\$a$i
    echo ${ip}
    #R=$(( $i - 1 ))
    scp -i /home/datlv/Documents/deevo/key/dev-full-rights.pem -r /home/datlv/Documents/deevo/configproduction/* ubuntu@${ip}:/home/ubuntu/hyperledgerconfig/data/
done
ssh -p 22 -i /home/datlv/Documents/deevo/key/dev-full-rights.pem ubuntu@13.229.71.175 'if [ $(pidof java) ] ; then kill $(pidof java) ; fi; cd /opt/gopath/src/github.com/deevotech/sc-network.deevo.io/scripts-1.2; ./start-replica.sh -g replicas -n 0; exit;'
ssh -p 22 -i /home/datlv/Documents/deevo/key/dev-full-rights.pem ubuntu@54.255.205.146 'if [ $(pidof java) ] ; then kill $(pidof java) ; fi; cd /opt/gopath/src/github.com/deevotech/sc-network.deevo.io/scripts-1.2; ./start-replica.sh -g replicas -n 1; exit;'
ssh -p 22 -i /home/datlv/Documents/deevo/key/dev-full-rights.pem ubuntu@54.179.187.79 'if [ $(pidof java) ] ; then kill $(pidof java) ; fi; cd /opt/gopath/src/github.com/deevotech/sc-network.deevo.io/scripts-1.2; ./start-replica.sh -g replicas -n 2; exit;'
ssh -p 22 -i /home/datlv/Documents/deevo/key/dev-full-rights.pem ubuntu@54.255.236.246 'if [ $(pidof java) ] ; then kill $(pidof java) ; fi; cd /opt/gopath/src/github.com/deevotech/sc-network.deevo.io/scripts-1.2; ./start-replica.sh -g replicas -n 3; exit;'
#ssh -p 22 -i /home/datlv/Documents/deevo/key/dev-full-rights.pem ubuntu@18.136.105.95 'if [ $(pidof java) ] ; then kill $(pidof java) ; fi; cd /opt/gopath/src/github.com/deevotech/sc-network.deevo.io/scripts-1.2; ./start-replica.sh -g replicas -n 3; exit;'
#ssh -p 22 -i /home/datlv/Documents/deevo/key/dev-full-rights.pem ubuntu@18.136.104.14 'if [ $(pidof java) ] ; then kill $(pidof java) ; fi; cd /opt/gopath/src/github.com/deevotech/sc-network.deevo.io/scripts-1.2; ./start-replica.sh -g replicas -n 3; exit;'
#ssh -p 22 -i /home/datlv/Documents/deevo/key/dev-full-rights.pem ubuntu@13.250.112.83 'if [ $(pidof java) ] ; then kill $(pidof java) ; fi; cd /opt/gopath/src/github.com/deevotech/sc-network.deevo.io/scripts-1.2; ./start-replica.sh -g replicas -n 3; exit;'
#ssh -p 22 -i /home/datlv/Documents/deevo/key/dev-full-rights.pem ubuntu@52.221.181.66 'if [ $(pidof java) ] ; then kill $(pidof java) ; fi; cd /opt/gopath/src/github.com/deevotech/sc-network.deevo.io/scripts-1.2; ./start-replica.sh -g replicas -n 3; exit;'

