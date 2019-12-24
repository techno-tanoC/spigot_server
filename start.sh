#!/bin/sh

mkdir -p /data
cp -r /temp/* /data
cd /data
sed -i -e "s/eula=false/eula=${EULA}/" /data/eula.txt
java -Xms1G -Xmx1G -jar /app/spigot.jar nogui

