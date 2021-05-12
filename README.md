# Svxlink-led-status

2 scripts in bash which will allow you to follow:
- svxlink status (flashing orange led - active or stopped)
- the rx and tx traffic of svxlink (green led rx and red led tx)

#### Connecting the leds:

<img src = "https://github.com/f5swb/svxlink-led-status/blob/master/branchement github.png" title = "branch">

```
green led gpio 22
red led gpio 27
flashing orange led gpio 23
```

You can use others gpio just modify the bash scripts (led.sh and svxstatut.sh)


```
sudo nano led.sh
sudo nano svxstatut.sh
```


#### Get files to svxlink directory

```
cd /home/pi/svxlink
wget 
unzip xpto
```

#### Make bach files executable:

```
chmod +x led.sh
chmod +x svxstatut.sh
```

#### Test the correct operation before going any further:

```
sudo bash led.sh
sudo bash svxstatut.sh
```

#### Move the two files led.service and svxstatut.service to /etc/systemd/system

```
sudo mv led.sh /etc/systemd/system
sudo svxstatut.sh /etc/systemd/system
```


#### Enable the startup services

```
sudo systemctl enable led.service
sudo systemctl enable svxstatut.service
```

#### Start the services

```
sudo systemctl start led.service
sudo systemctl start svxstatut.service
```
#### Check the staus

```
sudo systemctl status led.service
sudo systemctl status svxstatut.service
```
