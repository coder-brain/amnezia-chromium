#!/bin/bash
set -e

# Start DBus session bus
eval $(dbus-launch --sh-syntax)
echo "DBus session started: $DBUS_SESSION_BUS_ADDRESS"


# Ensure resolvconf is running
# service resolvconf start || true
# ln -sf /run/resolvconf/resolv.conf /etc/resolv.conf
# echo "===== resolv.conf before VPN ====="
echo "nameserver 1.1.1.1" > /etc/resolv.conf
echo "nameserver 1.0.0.1" >> /etc/resolv.conf
cat /etc/resolv.conf || true


# Start AmneziaService in background
/opt/AmneziaVPN/service/AmneziaVPN-service.sh &
echo "AmneziaService started"

# Run the GUI client (foreground)
/opt/AmneziaVPN/client/AmneziaVPN.sh