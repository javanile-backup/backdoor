#!/bin/bash

##
# javanile/backdoor (v0.0.1)
# Reverse SSH tunnel for Docker
##

set -e

## Variables
r="^([^:]*)(:([0-9]+))?$" && [[ "${BACKDOOR_HOST}" =~ $r ]] && h="${BASH_REMATCH[1]}" && p="${BASH_REMATCH[3]}"
HOST=${h:-localhost}
PORT=${p:-10022}

## Run service as remote target
if [ -n "${BACKDOOR_BIND}" ]; then
    sleep 1
    echo "[BACKDOOR:INFO] Target bind port '${BACKDOOR_BIND}' on remote server '${HOST}:${PORT}'."
    /usr/sbin/sshd
    sshpass -p backdoor ssh -oStrictHostKeyChecking=accept-new \
        -R ${BACKDOOR_BIND}:127.0.0.1:10022 -p ${PORT} backdoor@${HOST}
fi

## Run service as active client
if [ -n "${BACKDOOR_OPEN}" ]; then
    sleep 1
    echo "[BACKDOOR:INFO] Client open port '${BACKDOOR_OPEN}' on remote server '${HOST}:${PORT}'."
    backdoor open ${BACKDOOR_OPEN} ${HOST}:${PORT}
    /usr/sbin/sshd -D
fi

## Run service as daemon
echo "[BACKDOOR:INFO] Server listen on port '${PORT}'."
/usr/sbin/sshd -D
