#!/bin/sh

sed -i -e "s/eula=false/eula=${EULA}/" eula.txt
java -Xms1G -Xmx1G -jar spigot.jar nogui

