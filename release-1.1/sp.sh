#!/bin/bash
set -e

usage() { echo "Usage: $0 [-i <number_of_ip>]" 1>&2; exit 1; }
while getopts ":i:" o; do
    case "${o}" in
        i)
            i=${OPTARG}
            ;;
        *)
            usage
            ;;
    esac
done
shift $((OPTIND-1))
if [ -z "${i}" ] ; then
    usage
fi

n=1 ; eval a$n="13.229.71.175"
n=2 ; eval a$n="54.255.205.146"
n=3 ; eval a$n="54.179.187.79"
n=4 ; eval a$n="54.255.236.246"
n=5 ; eval a$n="18.136.105.95"
n=6 ; eval a$n="18.136.104.14"
n=7 ; eval a$n="13.250.112.83"
n=8 ; eval a$n="52.221.181.66"
n=9 ; eval a$n="54.169.140.0"
n=10 ; eval a$n="18.136.205.13" # api.deevo.io
n=11 ; eval a$n="52.77.238.1" # insight.deevo.io
n=12 ; eval a$n="13.250.109.150" # status.deevo.io
n=13 ; eval a$n="54.251.183.191" # sc.deevo.io
n=14 ; eval a$n="52.221.179.90" # lina.deevo.io
n=15 ; eval a$n="52.221.179.90" # benchmark.deevo.io
eval ip=\$a$i
echo ${ip}
ssh -p 22 -i /home/datlv/Documents/deevo/key/dev-full-rights.pem ubuntu@${ip}


