#!/bin/bash
set -e
CONFIG_PATH=/home/datlv/Documents/deevo/configproduction
CALIPER_PATH=/opt/gopath/src/github.com/hyperledger/caliper
PEERS="org1 org2 org3 org4 org5"
rm -rf ${CONFIG_PATH}/crypto-config
# generate for orderer
mkdir -p ${CONFIG_PATH}/crypto-config
mkdir -p ${CONFIG_PATH}/crypto-config/ordererOrganizations
mkdir -p ${CONFIG_PATH}/crypto-config/ordererOrganizations/org0.deevo.com
mkdir -p ${CONFIG_PATH}/crypto-config/ordererOrganizations/org0.deevo.com/users
mkdir -p ${CONFIG_PATH}/crypto-config/ordererOrganizations/org0.deevo.com/orderers
cp -R ${CONFIG_PATH}/orderer ${CONFIG_PATH}/crypto-config/ordererOrganizations/org0.deevo.com/orderers/
mv ${CONFIG_PATH}/crypto-config/ordererOrganizations/org0.deevo.com/orderers/orderer ${CONFIG_PATH}/crypto-config/ordererOrganizations/org0.deevo.com/orderers/orderer0.org0.deevo.com
cp -R ${CONFIG_PATH}/orgs/org0/msp ${CONFIG_PATH}/crypto-config/ordererOrganizations/org0.deevo.com/
cp -R ${CONFIG_PATH}/orgs/org0/admin ${CONFIG_PATH}/crypto-config/ordererOrganizations/org0.deevo.com/users/
mv ${CONFIG_PATH}/crypto-config/ordererOrganizations/org0.deevo.com/users/admin ${CONFIG_PATH}/crypto-config/ordererOrganizations/org0.deevo.com/users/Admin@org0.deevo.com
cp -R ${CONFIG_PATH}/orgs ${CONFIG_PATH}/crypto-config/
# generate for peers
mkdir -p ${CONFIG_PATH}/crypto-config/peerOrganizations
for org in $PEERS ;
do
    mkdir -p ${CONFIG_PATH}/crypto-config/peerOrganizations/${org}.deevo.com
    mkdir -p ${CONFIG_PATH}/crypto-config/peerOrganizations/${org}.deevo.com/users
    mkdir -p ${CONFIG_PATH}/crypto-config/peerOrganizations/${org}.deevo.com/peers
    cp -R ${CONFIG_PATH}/orgs/${org}/msp ${CONFIG_PATH}/crypto-config/peerOrganizations/${org}.deevo.com/
    cp -R ${CONFIG_PATH}/peer0.${org}.deevo.com ${CONFIG_PATH}/crypto-config/peerOrganizations/${org}.deevo.com/peers/
    cp -R ${CONFIG_PATH}/orgs/${org}/admin ${CONFIG_PATH}/crypto-config/peerOrganizations/${org}.deevo.com/users/
    mv ${CONFIG_PATH}/crypto-config/peerOrganizations/${org}.deevo.com/users/admin ${CONFIG_PATH}/crypto-config/peerOrganizations/${org}.deevo.com/users/Admin@${org}.deevo.com
    KEYFILE=''
    for entry in `ls ${CONFIG_PATH}/crypto-config/peerOrganizations/${org}.deevo.com/users/Admin@${org}.deevo.com/msp/keystore/`; do
        KEYFILE=${entry}
    done
    cat ${CONFIG_PATH}/crypto-config/peerOrganizations/${org}.deevo.com/users/Admin@${org}.deevo.com/msp/keystore/${KEYFILE} > ${CONFIG_PATH}/crypto-config/peerOrganizations/${org}.deevo.com/users/Admin@${org}.deevo.com/msp/keystore/key.pem
    rm ${CONFIG_PATH}/crypto-config/peerOrganizations/${org}.deevo.com/users/Admin@${org}.deevo.com/msp/keystore/${KEYFILE}
    cp -R ${CONFIG_PATH}/tls-peer0.${org}.deevo.com ${CONFIG_PATH}/crypto-config/
    KEYFILE1=''
    for entry in `ls ${CONFIG_PATH}/crypto-config/tls-peer0.${org}.deevo.com/keystore/`; do
        KEYFILE1=${entry}
    done
    cat ${CONFIG_PATH}/crypto-config/tls-peer0.${org}.deevo.com/keystore/${KEYFILE1} > ${CONFIG_PATH}/crypto-config/tls-peer0.${org}.deevo.com/keystore/key
    rm ${CONFIG_PATH}/crypto-config/tls-peer0.${org}.deevo.com/keystore/${KEYFILE1}
done
rm -rf ${CALIPER_PATH}/network/fabric/mynetwork
cp -R ${CONFIG_PATH} ${CALIPER_PATH}/network/fabric/
mv ${CALIPER_PATH}/network/fabric/configproduction ${CALIPER_PATH}/network/fabric/mynetwork
echo "done";
ls -la ${CALIPER_PATH}/network/fabric/mynetwork