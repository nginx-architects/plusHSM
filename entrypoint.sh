#!/bin/bash

# Enter your CloudHSM Crypto User (CU) credentials below

export CLOUDHSM_PIN=username:password

set -euxo pipefail

handle_term()
{
    echo "received TERM signal"
    echo "stopping nginx ..."
    kill -TERM "${nginx_pid}" 2>/dev/null
}

trap 'handle_term' TERM

# Launch nginx
echo "starting nginx ..."
openssl engine -t cloudhsm
nginx -g "daemon off;" &

nginx_pid=$!

wait_term()
{
    trap - TERM
    kill -QUIT "${nginx_pid}" 2>/dev/null
    echo "waiting for nginx to stop..."
    wait ${nginx_pid}
}

wait_term

