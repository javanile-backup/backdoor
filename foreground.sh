#!/bin/bash

set -e

## Variables
PORT=${BACKDOOR_PORT:-10022}
HOST=${BACKDOOR_HOST:-localhost}
USER=${BACKDOOR_USER:-root}

## Run service as remote target
if [ -n "${BACKDOOR_BIND}" ]; then
    echo "[BACKDOOR:INFO] Target bind port '${BACKDOOR_BIND}' on remote server '${HOST}:${PORT}'."
    backdoor bind ${BACKDOOR_BIND} ${HOST}:${PORT}
    exit 2
fi

## Run service as active client
if [ -n "${BACKDOOR_OPEN}" ]; then
    echo "[BACKDOOR:INFO] Client open port '${BACKDOOR_OPEN}' on remote server '${HOST}:${PORT}'."
    backdoor open ${BACKDOOR_OPEN} ${HOST}:${PORT}
    exit 3
fi

## Run service as daemon
echo "[BACKDOOR:INFO] Server listen on port '${PORT}'"
/usr/sbin/sshd -D
