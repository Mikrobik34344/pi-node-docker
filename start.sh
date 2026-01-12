#!/usr/bin/env bash

set -e

MODE=${1:-persistent}
NETWORK=${PI_NETWORK:-pi-mainnet}

echo "Starting Pi Network Stellar Quickstart - mode: $MODE - network: $NETWORK"

# Copy config files on first run
if [ ! -f /opt/stellar/stellar-core.cfg ]; then
    cp -r /opt/stellar/$NETWORK/* /opt/stellar/
fi

# Start supervisor
exec /usr/bin/supervisord -c /etc/supervisor/supervisord.conf
