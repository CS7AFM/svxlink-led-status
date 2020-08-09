#!/bin/bash
# script de gestion led verte rx et led rouge tx svxlink 
# F5SWB 2020

# led rouge 
LED1=27

# led verte
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


# ici on lance une boucle 
# on ouvre svxlink.log et l'on récupère l'état ON ou OFF

while true;


 do RX=^$(tail -1 /tmp/svxlink.log)
 VAR1=${RX:56}
 if [[ "$VAR1" =~ "ON" ]]
 then
    echo 1 > /sys/class/gpio/gpio$LED2/value
    else
    if [[ "$VAR1" =~ "OFF" ]]
    then
    echo 0 > /sys/class/gpio/gpio$LED2/value
    fi
fi

# on récupère le callsign en TX
 TX=^$(tail -1 /tmp/svxlink.log)
 VAR2=${RX:61}
 if [[ "$VAR2" =~ "F5SWB H" ]]
 then
    echo 1 > /sys/class/gpio/gpio$LED1/value
    else
    echo 0 > /sys/class/gpio/gpio$LED1/value
fi

done

exit 0


