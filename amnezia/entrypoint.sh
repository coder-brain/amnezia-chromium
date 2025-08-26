#!/bin/bash
set -e

# Start DBus session bus
eval $(dbus-launch --sh-syntax)
echo "DBus session started: $DBUS_SESSION_BUS_ADDRESS"


# Start AmneziaService in background
/opt/AmneziaVPN/service/AmneziaVPN-service.sh &
echo "AmneziaService started"

# Run the GUI client (foreground)
/opt/AmneziaVPN/client/AmneziaVPN.sh