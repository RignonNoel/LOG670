[Retour au laboratoire 2](../TP2/)

# Verification

## P1 : Il n’y a pas de « deadlock »

On verifie qu'il n'y ai pas de deadlock, c'est a dire qu'il n'existe aucun cas possible ou le systeme ce retrouve dans un etat bloquant sans etape suivante.

Cette verification permet de valider par la meme occasion qu'il n'y a pas de boucle sans fin, sans quoi la generation des cas possibles ne sera pas possible par le systeme.

```
A[] not deadlock
```

## P2 : Il n’y a pas de collision (i.e. deux convois circulants en sens inverse) sur le pont.

On verifie que si il y a un convoi dans un sens sur le pont, il est impossible d'avoir un convoi dans l'autre sens sur ce meme pont. On effectue cette verification sur l'ensemble des cas possibles de notre systeme.

```
A[] (DirectionA1.SurPont || DirectionA2.SurPont || DirectionA3.SurPont) imply not (DirectionB1.SurPont || DirectionB2.SurPont || DirectionB3.SurPont)
```

## P3 : Le pont est juste et équitable (= « fair »).

## P4 : Un convoi qui arrive est certain de passer sur le pont à l’issue d’une durée bornée.

## P5 : Lorsqu'un convoi entre sur le pont, il en ressort.