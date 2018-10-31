#!/bin/bash
set -e
CONFIG_PATH=/home/datlv/Documents/deevo/configproduction
CALIPER_PATH=/opt/gopath/src/github.com/hyperledger/caliper
PEERS="org1 org2 org3 org4 org5"
rm -rf ${CONFIG_PATH}/crypto-config
# generate for orderer
mkdir -p ${CONFIG_PATH}/crypto-config
mkdir -p ${CONFIG_PATH}/crypto-config/ordererOrganizations
cp -R ${CONFIG_PATH}/orgs/org0 ${CONFIG_PATH}/crypto-config/ordererOrganizations/
mv ${CONFIG_PATH}/crypto-config/ordererOrganizations/org0 ${CONFIG_PATH}/crypto-config/ordererOrganizations/org0.deevo.io

mkdir -p ${CONFIG_PATH}/crypto-config/ordererOrganizations/org0.deevo.io/users
mkdir -p ${CONFIG_PATH}/crypto-config/ordererOrganizations/org0.deevo.io/orderers
mv ${CONFIG_PATH}/crypto-config/ordererOrganizations/org0.deevo.io/orderer1.org0.deevo.io ${CONFIG_PATH}/crypto-config/ordererOrganizations/org0.deevo.io/orderers/
mv ${CONFIG_PATH}/crypto-config/ordererOrganizations/org0.deevo.io/admin ${CONFIG_PATH}/crypto-config/ordererOrganizations/org0.deevo.io/users
mv ${CONFIG_PATH}/crypto-config/ordererOrganizations/org0.deevo.io/users/admin ${CONFIG_PATH}/crypto-config/ordererOrganizations/org0.deevo.io/users/Admin@org0.deevo.io

cp -R ${CONFIG_PATH}/orgs ${CONFIG_PATH}/crypto-config/
# generate for peers
mkdir -p ${CONFIG_PATH}/crypto-config/peerOrganizations
for org in $PEERS ;
do
    mkdir -p ${CONFIG_PATH}/crypto-config/peerOrganizations/${org}.deevo.io
    mkdir -p ${CONFIG_PATH}/crypto-config/peerOrganizations/${org}.deevo.io/users
    mkdir -p ${CONFIG_PATH}/crypto-config/peerOrganizations/${org}.deevo.io/peers
    cp -R ${CONFIG_PATH}/orgs/${org}/msp ${CONFIG_PATH}/crypto-config/peerOrganizations/${org}.deevo.io
    cp -R ${CONFIG_PATH}/orgs/${org}/peer1.${org}.deevo.io ${CONFIG_PATH}/crypto-config/peerOrganizations/${org}.deevo.io/peers/
    cp -R ${CONFIG_PATH}/orgs/${org}/admin ${CONFIG_PATH}/crypto-config/peerOrganizations/${org}.deevo.io/users/
    mv ${CONFIG_PATH}/crypto-config/peerOrganizations/${org}.deevo.io/users/admin ${CONFIG_PATH}/crypto-config/peerOrganizations/${org}.deevo.io/users/Admin@${org}.deevo.io
    KEYFILE=''
    for entry in `ls ${CONFIG_PATH}/crypto-config/peerOrganizations/${org}.deevo.io/users/Admin@${org}.deevo.io/msp/keystore/`; do
        KEYFILE=${entry}
    done
    cat ${CONFIG_PATH}/crypto-config/peerOrganizations/${org}.deevo.io/users/Admin@${org}.deevo.io/msp/keystore/${KEYFILE} > ${CONFIG_PATH}/crypto-config/peerOrganizations/${org}.deevo.io/users/Admin@${org}.deevo.io/msp/keystore/key.pem
    rm ${CONFIG_PATH}/crypto-config/peerOrganizations/${org}.deevo.io/users/Admin@${org}.deevo.io/msp/keystore/${KEYFILE}
    # user
    cp -R ${CONFIG_PATH}/orgs/${org}/user ${CONFIG_PATH}/crypto-config/peerOrganizations/${org}.deevo.io/users/
    mv ${CONFIG_PATH}/crypto-config/peerOrganizations/${org}.deevo.io/users/user ${CONFIG_PATH}/crypto-config/peerOrganizations/${org}.deevo.io/users/User@${org}.deevo.io
    KEYFILE=''
    for entry in `ls ${CONFIG_PATH}/crypto-config/peerOrganizations/${org}.deevo.io/users/User@${org}.deevo.io/msp/keystore/`; do
        KEYFILE=${entry}
    done
    cat ${CONFIG_PATH}/crypto-config/peerOrganizations/${org}.deevo.io/users/User@${org}.deevo.io/msp/keystore/${KEYFILE} > ${CONFIG_PATH}/crypto-config/peerOrganizations/${org}.deevo.io/users/User@${org}.deevo.io/msp/keystore/key.pem
    rm ${CONFIG_PATH}/crypto-config/peerOrganizations/${org}.deevo.io/users/User@${org}.deevo.io/msp/keystore/${KEYFILE}
    #cp -R ${CONFIG_PATH}/tls-peer1.${org}.deevo.io ${CONFIG_PATH}/crypto-config/
    #KEYFILE1=''
    #for entry in `ls ${CONFIG_PATH}/crypto-config/tls-peer1.${org}.deevo.iokeystore/`; do
    #    KEYFILE1=${entry}
    #done
    #cat ${CONFIG_PATH}/crypto-config/tls-peer1.${org}.deevo.iokeystore/${KEYFILE1} > ${CONFIG_PATH}/crypto-config/tls-peer1.${org}.deevo.iokeystore/key
    #rm ${CONFIG_PATH}/crypto-config/tls-peer1.${org}.deevo.iokeystore/${KEYFILE1}
done
rm -rf ${CALIPER_PATH}/network/fabric/mynetwork
cp -R ${CONFIG_PATH} ${CALIPER_PATH}/network/fabric/
mv ${CALIPER_PATH}/network/fabric/configproduction ${CALIPER_PATH}/network/fabric/mynetwork
echo "done";
ls -la ${CALIPER_PATH}/network/fabric/mynetwork