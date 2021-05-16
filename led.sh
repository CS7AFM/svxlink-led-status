#!/bin/bash
# made by F5SWB 2020
# Improved by CS7AFM 2021

# led green
LED1=27

# led red
LED2=22

cd /sys/class/gpio/

if [ -e /sys/class/gpio/export ]
then
        echo "$LED1" > /sys/class/gpio/export
        echo "$LED2" > /sys/class/gpio/export

fi

echo out > /sys/class/gpio/gpio$LED1/direction
echo 0 > /sys/class/gpio/gpio$LED1/value

echo out > /sys/class/gpio/gpio$LED2/direction
echo 0 > /sys/class/gpio/gpio$LED2/value

# check if transmitter "ON" then lightup red LED, if "OFF" then ligh down
while true;

 do TX=^$(tail -1 /var/log/svxlink)
 VAR1=${TX:56}
 if [[ "$VAR1" =~ "ON" ]]
 then
    echo 1 > /sys/class/gpio/gpio$LED2/value
    else
    if [[ "$VAR1" =~ "OFF" ]]
    then
    echo 0 > /sys/class/gpio/gpio$LED2/value
    fi
fi

# this checks if the squelsh if on "OPEN" state then light up the green LED, if not light down
 RX=^$(tail -1 /var/log/svxlink)
 VAR2=${RX:47}
 if [[ "$VAR2" =~ "OPEN" ]]
 then
    echo 1 > /sys/class/gpio/gpio$LED1/value
    else
    echo 0 > /sys/class/gpio/gpio$LED1/value

fi

done

exit 0
