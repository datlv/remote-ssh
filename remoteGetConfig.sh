#!/bin/bash
set -e
n=1 ; eval a$n="54.255.236.246"
n=2 ; eval a$n="18.136.105.95"
n=3 ; eval a$n="18.136.104.14"
n=4 ; eval a$n="13.250.112.83"
n=5 ; eval a$n="52.221.181.66"
n=6 ; eval a$n="54.169.140.0"

for i in 1 2 3 4 5 6
do
    eval ip=\$a$i
    echo ${ip}
    scp -i /home/datlv/Documents/deevo/key/dev-full-rights.pem -r  ubuntu@${ip}:/home/ubuntu/hyperledgerconfig/data/* /home/datlv/Documents/deevo/configproduction/
done



