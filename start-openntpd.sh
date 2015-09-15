#!/bin/bash
set -e

echo "=> Configuring Openntpd"

cp -v /etc/ntpd.conf.template /etc/ntpd.conf

BACKENDS=($BACKENDS)
for BACKEND in "${BACKENDS[@]}"
do
    echo "server ${BACKEND}" >> /etc/ntp.conf
done

echo "=> Starting Openntpd ... : "

exec ntpd -d -f /etc/ntpd.conf
