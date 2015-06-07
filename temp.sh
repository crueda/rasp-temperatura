#!/bin/bash
FECHA=$(date +\%Y\%m\%d\%H\%M\%S)
COMA=","
TEMP=$(/home/pi/temperatura/temperv14/temperv14 -c)
echo "$FECHA$COMA$TEMP" >> /home/pi/temperatura/temp.log
echo "$TEMP" > /home/pi/temperatura/temp_actual.log
