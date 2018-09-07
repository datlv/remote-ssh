#!/bin/bash
ssh -p 22 -i /home/datlv/Documents/deevo/key/dev-full-rights.pem ubuntu@54.169.140.0 ' rm -rf /home/ubuntu/hyperledgerconfig/data/*; exit; '
KEYFILE=""
SIGN_FILE=""
for entry in `ls /home/datlv/Documents/deevo/configproduction/orderer/msp/keystore/`; do
    KEYFILE=${entry}
done
for entry in `ls /home/datlv/Documents/deevo/configproduction/orderer/msp/signcerts/`; do
    SIGN_FILE=${entry}
done
echo "#Path to the genesis block for the system channel
GENESIS=/home/ubuntu/hyperledgerconfig/data/genesis.block

#The ID of the membership service provider (MSP)
MSPID=org0MSP

#Certificate of the node, compliant to Fabric's MSP guidelines
CERTIFICATE=/home/ubuntu/hyperledgerconfig/data/cert.pem

#Private key of the node, compliant to Fabric's MSP guidelines
PRIVKEY=/home/ubuntu/hyperledgerconfig/data/key.pem

#Number of signer/sending threads in the pool
PARELLELISM=10

#Maximum number of blocks to submit to each signer/sending thread
BLOCKS_PER_THREAD=10000

#IDs of the frontends present in the system, separate by commas
RECEIVERS=1000,2000

#Enable/disable envelope validation. Configuration envelopes are always verified regardless of this parameter
ENV_VALIDATION=true

#Enable/disable second block signature. Useful for benchmarking, but it must be enabled on production deployments, so that it abides to Fabric's implementation
BOTH_SIGS=true

#The acceptable difference between the state machine's time and the client's time. Only used if envelope validation is active
#or in the case of a reconfiguration envelope
TIME_WINDOW=15m
" > /home/datlv/Documents/deevo/configproduction/node.config
cat /home/datlv/Documents/deevo/configproduction/orderer/msp/keystore/$KEYFILE > /home/datlv/Documents/deevo/configproduction/key.pem
cat /home/datlv/Documents/deevo/configproduction/orderer/msp/signcerts/$SIGN_FILE > /home/datlv/Documents/deevo/configproduction/cert.pem

scp -i /home/datlv/Documents/deevo/key/dev-full-rights.pem -r /home/datlv/Documents/deevo/configproduction/* ubuntu@54.169.140.0:/home/ubuntu/hyperledgerconfig/data/
ssh -p 22 -i /home/datlv/Documents/deevo/key/dev-full-rights.pem ubuntu@54.169.140.0 ' cd /opt/gopath/src/github.com/deevotech/supply-chain-network/scripts; ./generate-genesis.sh; exit; '
sleep 5;
scp -i /home/datlv/Documents/deevo/key/dev-full-rights.pem ubuntu@54.169.140.0:/home/ubuntu/hyperledgerconfig/data/genesis.block /home/datlv/Documents/deevo/configproduction/genesis.block


