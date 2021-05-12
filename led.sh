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

# ici on récupère le call, si le call est > 5 caractères il faut modifier comme ceci : CALL=${VARCALL:16:6}
VARCALL=^$(head -n 2 /etc/spotnik/config.json | tail -n 1) ; CALL=${VARCALL:16:5}

# ici on lance une boucle
# on ouvre svxlink.log et on récupère l'état ON ou OFF
while true;

 do RX=^$(tail -1 /var/log/svxlink)
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

# on récupère le callsign en TX si le call est > 5 caractères il faut modifier comme ceci : VAR2=${TX:61:6}
 TX=^$(tail -1 /var/log/svxlink)
 VAR2=${TX:61:5}
 if [[ "$VAR2" = "$CALL" ]]
 then
    echo 1 > /sys/class/gpio/gpio$LED1/value
    else
    echo 0 > /sys/class/gpio/gpio$LED1/value
fi

done

exit 0




