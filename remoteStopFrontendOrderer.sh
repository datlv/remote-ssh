#!/bin/bash
set -e
n=9 ; eval a$n="54.169.140.0"
ssh -p 22 -i /home/datlv/Documents/deevo/key/dev-full-rights.pem  ubuntu@54.169.140.0 'kill $(pidof java); kill $(pidof orderer); exit;'



