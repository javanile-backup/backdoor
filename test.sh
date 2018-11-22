#!/bin/bash

r="^([^:]*)(:([0-9]+))?$" && [[ "$1" =~ $r ]] && h="${BASH_REMATCH[1]}" && p="${BASH_REMATCH[3]}"
HOST=

echo $BASH_REMATCH
echo "host: ${HOST}"
echo "port: ${PORT}"
