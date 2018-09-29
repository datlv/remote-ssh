#!/bin/bash
set -e
n=1 ; eval a$n="13.229.67.40"
n=2 ; eval a$n="13.250.109.169"
n=3 ; eval a$n="13.229.125.149"
n=4 ; eval a$n="54.179.181.86"
n=5 ; eval a$n="54.254.189.216"

for i in 1 2 3 4 5
do
    eval ip=\$a$i
    echo ${ip}
    ssh -p 22 -i /home/datlv/Documents/deevo/key/dev-full-rights.pem  ubuntu@${ip} 'kill $(pidof java); exit;'
done


