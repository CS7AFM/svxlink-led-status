# svxlink-led-status

2 scripts en bash qui vous permettront de suivre :
- le statut de svxlink (led orange clignotante - actif ou stoppé)
- le trafic rx et tx de svxlink ( led verte rx et led rouge tx)

1 - le branchement des leds : 
led verte gpio 27
led rouge gpio 22
led orange clignotante gpio 23
libre à vous de changer les gpio mais vous devrez modifier les scripts bash.
si vous souhaiter augmenter ou diminuer la vitesse de clignotement 
il suffit d'éditer le script svxstatut.sh et de vopus rendre :
ligne n temps d'illulination 
lignr n temps d'extinction 

2 - copie des fichiers et activation de s
led.sh et svxstatut.sh seront copiés dans /home
il convient d'éditer le ficher led.sh à la ligne n°
et remplacer XXXXX par votre call ex:F4XYZ
(la prochaine version ira récupérer directement le call dans /etc/spotnik/config.json ...)

Les scripts seront alors lancés en mode service avec system.d: 
copier les deux fichierS led.service et svxstatut.service dans /etc/systemd/system
pour les activer : 
sudo systemctl enable led.service 
sudo systemctl enable svxstatus.service
puis 
sudo systemctl start led.service 
sudo systemctl start svxstatus.service
pour controler le bon fonctionnement :
sudo systemctl statut led.service 
sudo systemctl statut svxstatus.service

commentaires : deux scripts au lieu d'un seul ?
Le script svxstatut.sh en plus de controler l'état du process de svxlink fait clignoter une led
et de facto il y des sleep. Ces pauses impactaient la réactivitée quelques fois de la détectection rx et tx.

Un portage en python3 diminuerait grandement l'occupation cpu même si celle-ci demeure très basse ...
