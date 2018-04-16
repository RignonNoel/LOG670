[Retour au laboratoire 3](../TP3/)

# QUESTIONS HYPOTHÉTIQUES

## Question A
> a. Y a-t-il des moments d’attente potentiels ? 

Il y a effectivement des moments d'attente potentiels pour l'un ou l'autre des robots, mais **jamais** pour les deux en même temps.

Ces moments d'attentes sont dus à un manque de palettes libre dans le stock ou à un manque d'espace entre les deux robots.

## Question B
> b. Cette distribution des quantités 
(espaces et palettes) est-elle optimale ?

La distribution des quantités est suffisante,  mais pourrait peut-être être réduite dépendamment  de la vitesse de production de chacun des deux  robots.

En effet, si on considère que les deux robots  mettent un temps identique pour chacune de leurs  actions il semble que nous ne dépassions jamais  l'utilisation de 3 palettes sur les 6 disponible : 

 - Temps 1 :
   - Le robot A demarre un moteur de camion (2)
 - Temps 2 :
   - Le robot A termine le moteur de camion (2)
   - Le robot B demarre un capot de camion (2)
   - Le robot A demarre un moteur de SUV (3)
 - Temps 3 :
   - Le robot B termine un capot de camion (1)
   - Le robot A termine le moteur de SUV (1)
   - Le robot B demarre un capot de SUV (1)
   - Le robot A demarre un capot de camion (3)

Cette affirmation n'est cependant valide  **que** dans le cadre ou les robots  avancent à même vitesse et/ou  **aucun** imprévu ne viendrait frapper la  chaine de production de temps à autre  (sinon le flux tendu impliquerait une  interruption complete de la production).

Nous pourrions donc, **oui**, considérer cette  distribution comme **optimale**.

## Question C
> c. Si la fabrication d’un moteur de camion 
est deux fois plus long que la fabrication d’un 
moteur de SUV, quelles seraient les nouvelles 
(si nécessaire) valeurs optimales pour les 
constantes (espaces et palettes) ?

Puisque les limitations apparaissent dans les  différences de vitesse **entre** les deux  robots cette différence ne ferait qu'impacter  le temps total de production et pourrait  mettre en interruption de production le  robot B en charge de capot par manque de stock.

 - Temps 1 :
   - Le robot A demarre un moteur de camion (2)
 - Temps 2 :
   - Le robot A continue un moteur de camion (2)
 - Temps 3 :
   - Le robot A termine le moteur de camion (2)
   - Le robot B demarre un capot de camion (2)
   - Le robot A demarre un moteur de SUV (3)
 - Temps 4 :
   - Le robot B termine un capot de camion (1)
   - Le robot A termine le moteur de SUV (1)
   - Le robot B demarre un capot de SUV (1)
   - Le robot A demarre un moteur de camion (3)
 - Temps 5 (assimilable au Temps 2):
   - Le robot B termine un capot de SUV (2)
   - Le robot A continue son moteur de camion (2)
