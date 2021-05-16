!/bin/bash
# made by F5SWB 2020
# Improved by CS7AFM 2021

LED3=23

cd /sys/class/gpio/

if [ -e /sys/class/gpio/export ]
then
        echo "$LED3" > /sys/class/gpio/export
fi

echo out > /sys/class/gpio/gpio$LED3/direction
echo 0 > /sys/class/gpio/gpio$LED3/value

while true;
do

SERVICE="svxlink"
if pgrep -x "$SERVICE" >/dev/null
then
    echo 1  > /sys/class/gpio/gpio$LED3/value
else
    echo 1  > /sys/class/gpio/gpio$LED3/value
    sleep 0.01 # timer illumination
    echo 0 > /sys/class/gpio/gpio$LED3/value
    sleep 0.01 #timer extinction

fi

done

exit 0
