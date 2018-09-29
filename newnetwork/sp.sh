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

n=1 ; eval a$n="13.229.67.40"
n=2 ; eval a$n="13.250.109.169"
n=3 ; eval a$n="13.229.125.149"
n=4 ; eval a$n="54.179.181.86"
n=5 ; eval a$n="54.254.189.216"
n=6 ; eval a$n="18.136.126.89"
n=7 ; eval a$n="54.179.185.222"
eval ip=\$a$i
echo ${ip}
ssh -p 22 -i /home/datlv/Documents/deevo/key/dev-full-rights.pem ubuntu@${ip}


