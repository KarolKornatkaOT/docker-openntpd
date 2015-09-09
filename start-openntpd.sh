#!/bin/bash
set -e

echo "=> Configuring Openntpd"

BACKENDS=($BACKENDS)
for BACKEND in "${BACKENDS[@]}"
do
    echo "server ${BACKEND}" >> /etc/ntp.conf
done

echo "=> Starting Openntpd ... : "

exec ntpd -d -f /etc/ntp.conf
