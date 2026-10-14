#!/bin/sh
set -e

PORT="${PORT:-10000}"
SERVER_XML="/usr/local/tomcat/conf/server.xml"

# Verify that Tomcat configuration exists
if [ ! -f "$SERVER_XML" ]; then
    echo "ERROR: Tomcat server.xml not found: $SERVER_XML"
    exit 1
fi

# Update the HTTP connector port safely
sed -i -E '/<Connector[[:space:]]/s/port="8080"/port="'"$PORT"'"/' "$SERVER_XML"

echo "Starting Tomcat on port $PORT"

# Start Tomcat
exec /usr/local/tomcat/bin/catalina.sh run