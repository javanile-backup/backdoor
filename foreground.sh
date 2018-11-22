#!/bin/bash

set -e

## Variables
PORT=${BACKDOOR_PORT:-10022}
HOST=${BACKDOOR_HOST:-localhost}
USER=${BACKDOOR_USER:-root}

## Run service as remote target
if [ -n "${BACKDOOR_BIND}" ]; then
    ssh -p ${PORT} backdoor@${HOST} -R ${BACKDOOR_BIND}:localhost:${PORT}
    exit 2
fi

## Run service as active client
if [ -n "${BACKDOOR_OPEN}" ]; then
    ssh -p ${PORT} backdoor@${HOST} "backdoor ${BACKDOOR_OPEN} ${USER}"
    exit 3
fi

## Run service as daemon
/usr/sbin/sshd -D
