#!/bin/bash
set -e

n=1 ; eval a$n="13.229.67.40"
n=2 ; eval a$n="13.250.109.169"
n=3 ; eval a$n="13.229.125.149"
n=4 ; eval a$n="54.179.181.86"
n=5 ; eval a$n="54.254.189.216"

ssh -p 22 -i /home/datlv/Documents/deevo/key/dev-full-rights.pem ubuntu@13.229.67.40 'cd /opt/gopath/src/github.com/deevotech/sc-network.deevo.io/release-1.2/scripts/; git pull;  ./build-plugin-account.sh; exit;'
ssh -p 22 -i /home/datlv/Documents/deevo/key/dev-full-rights.pem ubuntu@13.250.109.169 'cd /opt/gopath/src/github.com/deevotech/sc-network.deevo.io/release-1.2/scripts/; git pull; ./build-plugin-account.sh; exit;'
ssh -p 22 -i /home/datlv/Documents/deevo/key/dev-full-rights.pem ubuntu@13.229.125.149 'cd /opt/gopath/src/github.com/deevotech/sc-network.deevo.io/release-1.2/scripts/; git pull; ./build-plugin-account.sh; exit;'
ssh -p 22 -i /home/datlv/Documents/deevo/key/dev-full-rights.pem ubuntu@54.179.181.86 'cd /opt/gopath/src/github.com/deevotech/sc-network.deevo.io/release-1.2/scripts/; git pull; ./build-plugin-account.sh; exit;'
ssh -p 22 -i /home/datlv/Documents/deevo/key/dev-full-rights.pem ubuntu@54.254.189.216 'cd /opt/gopath/src/github.com/deevotech/sc-network.deevo.io/release-1.2/scripts/; git pull; ./build-plugin-account.sh; exit;'