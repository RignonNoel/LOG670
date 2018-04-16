[Retour au laboratoire 3](../TP3/)

# VÉRIFICATION COMPORTEMENTALE

## Graphe d'accessibilité

![graph](static/graph.PNG)

Le graphe d'accessibilite nous permet de faire certaines affirmations sur notre reseau:

 - Il y a 26 etat possible au total
 - Aucun des etat possible n'est bloquant
 - Il est possibe que le stock de palette libre soit insufisant
 - Il est possible que nous manquions d'espace libre entre les deux robots

Une réflexion sur ce graphe nous permet de  constater que les deux dernières considérations  dépendent uniquement de la vitesse de  fabrication des deux robots, ce dont nous  n'avons aucune connaissance dans l'énoncé.

Nous pourrions cependant utiliser ces deux  considérations pour ouvrir une discussion avec  les personnes compétentes et voir si l'augmentation  du stock ou de l'espace augmenterait le rendement  de l'usine.
