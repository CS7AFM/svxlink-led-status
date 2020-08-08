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
il suffit d'éditer le script svxstatut.sh et de vous rendre :

ligne n°24 = temps d'illumination 

ligne n°26 = temps d'extinction 

2 - copie des fichiers et test de bon fonctionnement

led.sh et svxstatut.sh seront copiés dans /home

puis les rendre exécutables :

chmod +x led.sh

chmod +x svxstatut.sh

il convient d'éditer le ficher led.sh à la ligne n°50
et remplacer XXXXX par votre call ex:F4XYZ

(la prochaine version ira récupérer directement le call dans /etc/spotnik/config.json ...)

vous pouvez tester le bon fonctionnement avant d'aller plus loin :

cd /home

bash led.sh

bash svxstatut.sh

3 - installation des services :

Les scripts seront alors lancés en mode service avec system.d:

copier les deux fichiers led.service et svxstatut.service dans /etc/systemd/system

pour les activer : 

sudo systemctl enable led.service 

sudo systemctl enable svxstatut.service

puis 

sudo systemctl start led.service 

sudo systemctl start svxstatut.service

pour controler le bon fonctionnement :

sudo systemctl statut led.service 

sudo systemctl statut svxstatut.service

 Commentaires : deux scripts au lieu d'un seul ?
 
Le script svxstatut.sh en plus de controler l'état du process de svxlink fait clignoter une led
et de facto il y des sleep.

Ces pauses impactaient la réactivitée quelques fois de la détectection rx et tx.

Et, enfin certains pourraient se demander pourquoi ne pas lire directement l'état des gpio de svxlink afin de savoir si l'on est en rx ou tx ?

Pour deux raisons, la première est que mon système est quelque peu différents pour la gestion tx et rx, et la deuxième est toute simple comme vous pourrez le constater dans les commentaires dans les scripts : 

on y apprend beaucoup de notions et de commandes ;)


Un portage en python3 diminuerait grandement l'occupation cpu même si celle-ci demeure très basse ...
