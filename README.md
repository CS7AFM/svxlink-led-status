# svxlink-led-status

2 scripts in bash which will allow you to follow:
- svxlink status (flashing orange led - active or stopped)
- the rx and tx traffic of svxlink (green led rx and red led tx)

1 - the connection of the leds:

<img src = "https://github.com/f5swb/svxlink-led-status/blob/master/branchement github.png" title = "branch">


green led gpio 22

red led gpio 27

flashing orange led gpio 23

You are free to change the gpio but you will have to modify the bash scripts.

if you want to increase or decrease the flashing speed
just edit the svxstatut.sh script and go:
illumination time
extinction time

**2 - copy files and test for proper operation**

led.sh and svxstatut.sh will be copied to /home/pi/svxlink

then make them executable:

chmod + x led.sh

chmod + x svxstatut.sh

you can test the correct operation before going any further:

cd / home

bash led.sh

bash svxstatut.sh

3 - installation of services:

The scripts will then be launched in service mode with system.d:

copy the two files led.service and svxstatut.service in / etc / systemd / system

to activate them:

sudo systemctl enable led.service

sudo systemctl enable svxstatut.service

then

sudo systemctl start led.service

sudo systemctl start svxstatut.service

to check correct operation:

sudo systemctl status led.service

sudo systemctl status svxstatut.service

 Comments: two scripts instead of one?
 
The svxstatut.sh script in addition to controlling the state of the svxlink process flashes a led
and de facto there is sleep.

These pauses impacted the reactivity of the rx and tx detection a few times.

And, finally some might wonder why not directly read the state of the svxlink gpio in order to know if one is in rx or tx?

For two reasons, the first is that my system is somewhat different for tx and rx handling, and the second is quite simple as you can see in the comments in the scripts:

we learn a lot of concepts and commands;)


A port to python3 would greatly reduce the cpu occupancy even if it remains very low ...
