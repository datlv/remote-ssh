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
    ssh -p 22 -i /home/datlv/Documents/deevo/key/dev-full-rights.pem  ubuntu@${ip} 'kill $(pidof java); exit;'
done


