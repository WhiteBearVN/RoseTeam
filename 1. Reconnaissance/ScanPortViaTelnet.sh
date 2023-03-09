#!/bin/bash

# Set the IP address or hostname of the remote host to scan
REMOTE_HOST="x.x.x.x"

# Set the range of ports to scan
START_PORT=1
END_PORT=65535

# Loop through the range of ports and attempt to connect via telnet
for (( port=$START_PORT; port<=$END_PORT; port++ ))
do
  # Print out which ports is open
  if echo -n "" | telnet $REMOTE_HOST $port 2>/dev/null | grep -q "Connected"; then
    echo "Port $port is open"
  fi
done
echo "Done"
