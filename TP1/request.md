[Retour au laboratoire 1](../TP1/)

# Requêtes

## ListeConvoisActifs:

##### Explication

Cette requête retourne tous les convois actifs. Un convoi est actif s’il contient au moins un véhicule.

Notre architecture définit un convoi comme un convoi nécessairement actif puisque tout convoi doit nécessairement avoir un véhicule.

```
listeConvoisActifs() : Set(Convoi) = self.autoroutes.convois->flatten()->select(c | c.vehicules->size() > 1)->asSet()
```