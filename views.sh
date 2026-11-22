#!/bin/bash
set -e

WEB="/home/zenoh/S4/Mr Naina/Web Dynamique/tomcat/apache-tomcat-10.1.62/webapps/Medical"

# JSP
cp -r "src/main/java/views/." "$WEB/"

# CSS statique
mkdir -p "$WEB/css"
cp -r "src/main/resources/css/." "$WEB/css/"

echo "Views + CSS synchronises -> $WEB"