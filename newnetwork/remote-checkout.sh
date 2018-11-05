#!/bin/bash
set -e
n=1 ; eval a$n="13.229.67.40"
n=2 ; eval a$n="13.250.109.169"
n=3 ; eval a$n="13.229.125.149"
n=4 ; eval a$n="54.179.181.86"
n=5 ; eval a$n="54.254.189.216"
n=6 ; eval a$n="18.136.126.89"
n=7 ; eval a$n="54.169.181.172";
n=8 ; eval a$n="13.250.35.59";
n=9 ; eval a$n="13.229.233.128";
n=10 ; eval a$n="54.179.143.121";


for i in 1 2 3 4 5 6 7 8 9 10
do
    eval ip=\$a$i
    echo ${ip}
    ssh -p 22 -i /home/datlv/Documents/deevo/key/dev-full-rights.pem ubuntu@${ip} 'cd /opt/gopath/src/github.com/deevotech/ && rm -rf sc-network.deevo.io && git clone git@github.com:deevotech/sc-network.deevo.io.git && cd sc-network.deevo.io && git reset --hard && git checkout release-1.2 && git pull && exit;'
done



