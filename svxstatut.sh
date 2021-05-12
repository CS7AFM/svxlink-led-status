#!/bin/bash
# script de gestion led orange status svxlink 
# F5SWB 2020 

LED3=23

cd /sys/class/gpio/

if [ -e /sys/class/gpio/export ]
then
        echo "$LED3" > /sys/class/gpio/export
fi

echo out > /sys/class/gpio/gpio$LED3/direction
echo 0 > /sys/class/gpio/gpio$LED3/value


# ici on lance une boucle 
# on récupère le process de svxlink 
# si il est égal à zero on éteind la led sinon on l'a fait clignoter

while true;
do

svxlink=$(ps -ef | grep svxlink | grep -v "grep" | wc -l)
if [ $svxlink -eq 0 ]; # If process svxlink is not running
   then
    echo 0 > /sys/class/gpio/gpio$LED3/value
    else	
    echo 1  > /sys/class/gpio/gpio$LED3/value
    sleep 2 # timer illumination 
    echo 0 > /sys/class/gpio/gpio$LED3/value
    sleep 0.4 #timer extinction
fi


done

exit 0
