#!/bin/bash

set -e

# Répertoires
SRC_DIR="src/main/java"
RESOURCES_DIR="src/main/resources"
BUILD_DIR="build"
CLASSES_DIR="$BUILD_DIR/classes"
WEBAPP_DIR="$BUILD_DIR/webapp"
TOMCAT_WEBAPPS="/home/zenoh/S4/Mr Naina/Web Dynamique/tomcat/apache-tomcat-10.1.62/webapps"
WAR_NAME="Medical.war"

# Nettoyage
rm -rf "$BUILD_DIR"

# Compilation
echo "Compilation..."
javac -parameters -cp "lib/*" \
      -d "$CLASSES_DIR" $(find "$SRC_DIR" -name "*.java")

# Structure WAR
echo "Creation du WAR..."
mkdir -p "$WEBAPP_DIR/WEB-INF/classes" "$WEBAPP_DIR/WEB-INF/lib"

# Copie des classes compilees
cp -r "$CLASSES_DIR/"* "$WEBAPP_DIR/WEB-INF/classes/"

# Copie des JARs
cp lib/*.jar "$WEBAPP_DIR/WEB-INF/lib/"

# Copie de web.xml
cp web.xml "$WEBAPP_DIR/WEB-INF/"
cp "$RESOURCES_DIR/narrafw.properties" "$WEBAPP_DIR/WEB-INF/classes"

# Copie des ressources web publiques (CSS, images, etc.)
if [ -d "$RESOURCES_DIR/css" ]; then
    mkdir -p "$WEBAPP_DIR/css"
    cp -r "$RESOURCES_DIR/css/"* "$WEBAPP_DIR/css/"
fi

# Copie des fichiers web (jsp, html, etc.)
if [ -d "$SRC_DIR/views" ]; then
    cp -r "$SRC_DIR/views/"* "$WEBAPP_DIR/"
fi

# Creation du .war
cd "$WEBAPP_DIR"
jar -cf "../$WAR_NAME" .
cd - > /dev/null

# Deploiement vers Tomcat
echo "Deploiement vers Tomcat..."
cp "$BUILD_DIR/$WAR_NAME" "$TOMCAT_WEBAPPS/"

# Nettoyage
rm -rf "$BUILD_DIR"

echo "Deploiement termine : $TOMCAT_WEBAPPS/$WAR_NAME"
