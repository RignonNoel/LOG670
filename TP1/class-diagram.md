[Retour au laboratoire 1](../TP1/)

# Diagrammes de classe

Cette section présente un diagramme de 
classes de notre laboratoire.

![class_diagram](screenshots/class_diagram.png)

## Explication

1. Une classe `Manageur` nous permet d'instancer des systemes de gestion de convoi et donc de simuler de multipler experiences de recherche.

2. Une classe `Autoroute` nous permet d'instancer des voies de circulations a double sens pouvant contenir des convois ou bien des vehicules libres :
   - Une autoroute peut etre vide (aucun vehicule ni convoi)
   - Une autoroute comporte deux destination (`A` et `B`)

3. Une classe `Convoi` nous permet d'instancer des groupes automatise de vehicules autonome ou non :
   - Un convoi comporte au minimum un vehicule leader.
   - Un convoi ne peux comporter que des vehicules allant dans la meme direction
   - Un convoi doit comporter au moins un conducteur dans sa liste de vehicules