#!/bin/sh
set -e

PORT="${PORT:-10000}"

# Update Tomcat's HTTP connector port
sed -i "s/port=\"8080\"/port=\"$PORT\"/" 
  /usr/local/tomcat/conf/server.xml

# Start Tomcat in the foreground
exec catalina.sh run