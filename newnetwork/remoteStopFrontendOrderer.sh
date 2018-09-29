#!/bin/bash
set -e
n=9 ; eval a$n="18.136.126.89"
ssh -p 22 -i /home/datlv/Documents/deevo/key/dev-full-rights.pem  ubuntu@18.136.126.89 'kill $(pidof java); kill $(pidof orderer); exit;'



