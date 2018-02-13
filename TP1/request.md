[Retour au laboratoire 1](../TP1/)

# Requêtes

## ListeConvoisActifs:

##### Explication

Cet requêtes retourne tout les convois actif. Un convoi est actil si il contient au moins un vehicule.
Notre architecture defini un convoi comme un convoi necessairement actif pusque tout convoi dois nesesairement avoir un vehicule.

```
    listeConvoisActifs() : Set(Convoi) = self.autoroutes.convois->flatten()->select(c | c.vehicules->size() > 1)->asSet()
```