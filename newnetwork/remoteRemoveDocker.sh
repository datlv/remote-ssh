#!/bin/bash
set -e
n=1 ; eval a$n="13.229.67.40"
n=2 ; eval a$n="13.250.109.169"
n=3 ; eval a$n="13.229.125.149"
n=4 ; eval a$n="54.179.181.86"
n=5 ; eval a$n="54.254.189.216"
n=6 ; eval a$n="18.136.126.89"

for i in 1 2 3 4 5 6
do
    eval ip=\$a$i
    echo ${ip}
   ssh -p 22 -i /home/datlv/Documents/deevo/key/dev-full-rights.pem  ubuntu@${ip} '/opt/gopath/src/github.com/deevotech/supply-chain-network/scripts/remove-docker-chaincode.sh; exit; '
done
