#!/bin/bash
set -e

echo "=> Configuring Openntpd"

cp -v /etc/ntpd.conf.template /etc/openntpd/ntpd.conf

BACKENDS=($BACKENDS)
for BACKEND in "${BACKENDS[@]}"
do
    echo "server ${BACKEND}" >> /etc/openntpd/ntpd.conf
done

echo "=> Starting Openntpd ... : "

exec ntpd -d -f /etc/openntpd/ntpd.conf
