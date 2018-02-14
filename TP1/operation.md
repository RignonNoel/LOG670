[Retour au laboratoire 1](../TP1/)

# Operations

## Autoroute::dissoudre()

##### Explication

Dissout un convoi et réassigne la totalité de ses voitures directement sur l’autoroute.

On ne peut dissoudre que les convois présents sur l’autoroute faisant l’appel.

```
dissoudre(c:Convoi) begin
    for v in c.vehicules do
        insert (c.autoroute, v) into AutorouteVehicule;
    end;
    delete (c.autoroute, c) from AutorouteConvoi;
    destroy c
end
 
pre: c.autoroute = self
 
post: c = Undefined
```

## Autoroute::addConvoi()

##### Explication

Crée et ajoute un convoi sur l’autoroute.

```
addConvoi(vehicules: Set(Vehicule), leader: Vehicule) begin
    declare c : Convoi;
    c := new Convoi;
    insert (self, c) into AutorouteConvoi;
    for v in vehicules do
        insert (c, v) into convoiVehicules;
        delete (self, v) from AutorouteVehicule;
    end;
    insert (leader,c) into convoiLeader;
end
 
-- PRE : Verifie que tout les vehicules sont bien sur cette autoroute
pre: vehicules->select(v|v.autoroute = self)->size() = vehicules->asSet()->size()
 
-- PRE : Verifie que tout les vehicules sont dans la meme direction
pre: vehicules.Direction->flatten()->asSet()->size() = 1
 
-- PRE : Verifie si le leader est bien dans la liste de vehicule en attribut (verification des parametres)
pre: vehicules->select(v|v = leader)->size() = 1
 
-- POST : Verifie si la liste de vehicule dans le convoi est bonne
post: leader.convoiLeader.vehicules->flatten()->asSet() = vehicules
 
-- POST : Verifie que le nouveau convoi est bien sur cette autoroute
post: leader.convoiLeader.autoroute->flatten()->asSet()->includes(self)
```

## Autoroute::fusionConvoi()

##### Explication

Fusionne deux convois en un seul (mets le contenu du deuxième dans le premier).

```
fusionConvoi(convoi1: Convoi, convoi2: Convoi) begin
    for v in convoi2.vehicules do
        insert (convoi1, v) into convoiVehicules;
        delete (convoi2, v) from convoiVehicules;
    end;
    delete (convoi2.vehiculeLeader, convoi2) from convoiLeader;
    destroy convoi2;
end
 
-- PRE : Verifie si les deux convois sont bien sur la meme autoroute
pre: convoi1.autoroute = convoi2.autoroute
 
-- PRE : Verifie que les convois sont bien sur cette autoroute (on sait deja qu'ils sont sur la meme)
pre: convoi1.autoroute->includes(self)
 
-- PRE : Verifie que les deux convois vont dans la meme direction
pre: convoi1.vehicules.Direction->flatten()->asSet() = convoi2.vehicules.Direction->flatten()->asSet()
```

## Autoroute::splitConvoi()

##### Explication

Divise un convoi en deux.
```
splitConvoi(convoi: Convoi, vehicules: Set(Vehicule), leader: Vehicule) begin
    declare c : Convoi;
    c := new Convoi;
    insert (self, c) into AutorouteConvoi;
    for v in vehicules do
        insert (c, v) into convoiVehicules;
        delete (convoi, v) from convoiVehicules;
    end;
    insert (leader, c) into convoiLeader;
end
 
-- PRE : Verifie que le convoi est bien sur cette autoroute
pre: convoi.autoroute->includes(self)
 
-- PRE : Verifie que tout les vehicules de la liste offerte en parametre sont bien dans le convoi
pre: vehicules->select(v|v.convoi = convoi)->flatten()->size() = vehicules->asSet()->size()
 
-- PRE : Verifie que le leader est dans la liste de vehicule offert en parametre
pre: vehicules->includes(leader)
 
-- PRE : Verifie que le leader du nouveau convoi n'est pas le meme que le convoi actuel
pre: convoi.vehiculeLeader->excludes(leader)
 
-- POST : Verifie que le nouveau convoi comporte bien la bonne liste de vehicule
post: leader.convoiLeader.vehicules->flatten()->asSet() = vehicules
 
-- POST : Verifie que le convoi de base de contient plus aucune des voitures offerte en parametre
post: convoi.vehicules->select(v|vehicules->includes(v))->isEmpty
```

## Vehicule::leaveConvoi()

##### Explication

Le véhicule quitte le convoi.

```
leaveConvoi() begin
    self.convoi.removeVehicule(self)
end
```

## Vehicule::joinConvoi()

##### Explication

Le véhicule rejoint un convoi.

```
joinConvoi(convoi: Convoi) begin
    convoi.addVehicule(self)
end
```

## Convoi::setLeader()

##### Explication

Change le leader d'un convoi.

```

setLeader(leader: Vehicule) begin
    delete (self.vehiculeLeader, self) from convoiLeader;
    insert (leader, self) into convoiLeader;
end
 
pre : self.vehicules->includes(leader)
 
pre : self.vehiculeLeader->excludes(leader)
 
post : self.vehiculeLeader->includes(leader)
```

## Convoi::removeVehicule()

##### Explication

Enlève un véhicule du convoi.

```
removeVehicule(vehicule: Vehicule) begin
    delete (self, vehicule) from convoiVehicules;
    insert (self.autoroute, vehicule) into AutorouteVehicule;
end
 
pre : self.vehicules->includes(vehicule)
 
pre : self.vehiculeLeader->excludes(vehicule)
 
post : self.vehicules->excludes(vehicule)
```

## Convoi::addVehicule()

##### Explication

Ajoute un véhicule au convoi.

```
addVehicule(vehicule: Vehicule) begin
    insert (self, vehicule) into convoiVehicules;
    delete (self.autoroute, vehicule) from AutorouteVehicule;
end
 
pre : self.vehicules->excludes(vehicule)
 
pre : self.autoroute = vehicule.autoroute
 
pre : vehicule.convoi = Undefined
 
post : self.vehicules->includes(vehicule)
```