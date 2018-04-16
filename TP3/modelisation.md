[Retour au laboratoire 3](../TP3/)

# MODÉLISATION ET SIMULATION

## Presentation generale

Voici notre réseau de Petri lors du lancement de la simulation:

![simulation](static/Capture.PNG)

Nous y retrouvons:

 - Un stock de palettes (6) sur la gauche
 - Le robot de moteur sur la gauche
   - Il dispose de plusieurs ressources en stock illimité
   - Il ne dispose que d'un seul jeton d'action (ie: il ne peut faire qu'une chose à la fois) 
 - Le robot de capots sur la droite
   - Il dispose de plusieurs ressources en stock illimité
   - Il dispose de SUV et Camion motorisés en quantité limite
   - Il ne dispose que d'un seul jeton d'action (ie: il ne peut faire qu'une chose à la fois) 
 - Un stock d'espace libre `P19` (4) entre les deux robots

 
## Modification de l'espace libre entre les deux robots

![simulation](static/Capture1.PNG)

Comme vous pouvez le constater, la présence d'un camion entre les deux robots occupe deux palettes :

 - Il ne reste que 4 palettes de libres en stock
 - Il ne reste que deux espaces libres entre les deux camions

 
## Manque d'espace libre entre les deux robots

![simulation](static/Capture2.PNG)

Comme vous pouvez le constater, le moteur de camion en cours  ne peut pas être terminé, car il ne reste qu'une seule place  entre les deux robots et qu'un camion prend deux espaces libres.

## Liberation d'espace libre entre les deux robots

![simulation](static/Capture3.PNG)

En suivant le même principe, le moteur de camion en cours qui  ne pouvais-ce terminer a l'étape précédente peut maintenant  ce terminer puisque deux places libres on été faite entre les  deux robots et qu'il n'en manquait qu'une seule.

## Manque de palettes libre en stock

![simulation](static/Capture4.PNG)

Lorsque la production se poursuit avec l'étape de  fabrication des capots il est possible que le nombre de  palettes nécessaires dépasse le stock disponible (6).

Comme vous pouvez le voir, le cas échéant, la  production de moteur est mis en pause faute de  moyen de transport.

## Liberation de palettes libre dans le stock

![simulation](static/Capture5.PNG)

Comme vous pouvez le constater, lors de la fin  de production d'un capot les palettes sont libérées  et remises en stock, permettant ainsi de reprendre  la production de moteur qui peut être en  interruption faute de stock.
