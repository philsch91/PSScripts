#!/bin/bash

# update-ddns.sh

# get actual public ip
IP=$(curl --silent https://diagnostic.opendns.com/myip)
echo "public IP is ${IP}"

# get ip from ddns service (fqdn)
DNSIP=$(dig +short philsch.ddnss.de @8.8.8.8)
echo "DNS IP is ${DNSIP}"

# update all services if ddns services differ to actual public ip
if [ "${DNSIP}" == "${IP}" ]; then
  echo "IP is up-to-date"
  exit 0
fi

curl -u username:password "https://updates.dnsomatic.com/nic/update?hostname=all.dnsomatic.com"
