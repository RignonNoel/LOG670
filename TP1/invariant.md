[Retour au laboratoire 1](../TP1/)

# Invariants

## VehiculeAUnConducteurOuUnCapteur:

##### Explication

Cet invariant permet de vérifier que chaque véhicule a un conducteur ou bien un capteur (radar, camera, etc..) au minimum.

La logique est assez simple à comprendre puisqu'elle consiste en plusieurs **or** en série demandant d'avoir un conducteur, un sonar ou une caméra.
 
```
-- VehiculeAUnConducteurOuUnCapteur:
-- Un véhicule doit avoir un conducteur ou bien au moins un capteur (radar, camera, etc..).
 
context i:Vehicule
    inv VehiculeAUnConducteurOuUnCapteur:
       i.conducteur->notEmpty
       or i.sonar->notEmpty
       or i.camera->notEmpty
```

##### Preuve d'indépendance

Dans cette preuve `Vehicule3` n'a ni conducteur ni capteur.

![Preuve_independance](screenshots/B-VehiculeAUnConducteurOuUnCapteur.png)

![Preuve_independance_table](screenshots/B-VehiculeAUnConducteurOuUnCapteur-table.png)


## ConvoiAUnConducteurMinimum

##### Explication

Cet invariant permet de vérifier que chaque convoi dispose d'au minimum **un** conducteur, peu importe sa position dans le convoi.

Au niveau de la logique, il suffit de vérifier qu'il existe au moins un conducteur dans la liste de véhicule du convoi ou dans le véhicule leader.

```
-- ConvoiAUnConducteurMinimum:
-- Un convoi doit avoir au moins un conducteur dans les véhicules du convoi.
 
context i:Convoi
    inv ConvoiAUnConducteurMinimum:
        i.vehicules->exists(e|e.conducteur->notEmpty)
        or i.vehiculeLeader.conducteur->notEmpty

```

##### Preuve d'indépendance

Dans cette preuve `Convoi1` n'a aucun conducteur.

![Preuve_independance](screenshots/B-ConvoiAUnConducteurMinimum.png)

![Preuve_independance_table](screenshots/B-ConvoiAUnConducteurMinimum-table.png)


## LeaderIsInVehiculesList

##### Explication

Cet invariant permet de vérifier que le véhicule leader de chaque convoi est **aussi** présent dans la liste des véhicules en faisant partie.

```
-- LeaderIsInVehiculesList:
-- Le leader doit être présent dans la liste de véhicule.
 
context i:Convoi
    inv LeaderIsInVehiculesList:
        i.vehicules->select(v|v = i.vehiculeLeader)->notEmpty
```

##### Preuve d'indépendance

Dans cette preuve `Convoi2` n'a pas de leader.

![Preuve_independance](screenshots/B-LeaderIsInVehiculesList.png)

![Preuve_independance_table](screenshots/B-LeaderIsInVehiculesList-table.png)

## ConvoiADesVehiculesDansLaMemeDirection

##### Explication

Cet invariant permet de vérifier que les convois ne comportent **QUE** des véhicules allant dans la même direction.


```
-- ConvoiADesVehiculesDansLaMemeDirection:
-- Un convoi ne contient que des véhicules allant dans la même direction.
 
context i:Convoi
    inv ConvoiADesVehiculesDansLaMemeDirection:
        i.vehicules.Direction->flatten()->asSet()->size() = 1
```

##### Preuve d'indépendance

Dans cette preuve `Convoi1` contient `Vehicule1` allant en direction de `A` et `Vehicule2` allant en direction de `B`.

![Preuve_independance](screenshots/B-ConvoiADesVehiculesDansLaMemeDirection.png)

![Preuve_independance_table](screenshots/B-ConvoiADesVehiculesDansLaMemeDirection-table.png)


## VehiculeAUneDirectionValide

##### Explication

Cet invariant permet de vérifier que tous les véhicules ont une direction et que cette dernière est valide (il n'existe que deux sens sur une autoroute).

```
-- VehiculeAUneDirectionValide:
-- Un véhicule a toujours une direction valide.
 
context i:Vehicule
    inv VehiculeAUneDirectionValide:
        Set {i.Direction}->intersection(Set {'A','B'})->notEmpty
```

##### Preuve d'indépendance

Dans cette preuve `Vehicule3` et `Vehicule4` vont en direction de `C`, ce qui est une direction invalide.

![Preuve_independance](screenshots/B-VehiculeAUneDirectionValide.png)

![Preuve_independance_table](screenshots/B-VehiculeAUneDirectionValide-table.png)


## VehiculeEstSurUneAutorouteOuDansUnConvoi

##### Explication

Cet invariant permet de vérifier que tous les véhicules sont soit sur une autoroute soit dans un convoi, mais pas les deux en même temps.

```
-- VehiculeEstSurUneAutorouteOuDansUnConvoi:
-- Un véhicule est soit dans un convoi soit sur une autoroute, mais pas les deux
 
context i:Vehicule
    inv VehiculeEstSurUneAutorouteOuDansUnConvoi:
        if i.autoroute->notEmpty
        then i.convoi = Undefined
        else i.convoi->notEmpty
        endif
```

##### Preuve d'indépendance

Dans cette preuve `Vehicule1` et sur l'autoroute `A1` **ET** dans `Convoi`, or, il est impossible pour un véhicule d'être considéré comme libre tout en étant dans un convoi.

![Preuve_independance](screenshots/B-VehiculeEstSurUneAutorouteOuDansUnConvoi.png)

![Preuve_independance_table](screenshots/B-VehiculeEstSurUneAutorouteOuDansUnConvoi-table.png)
