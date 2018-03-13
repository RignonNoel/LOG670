[Retour au laboratoire 2](../TP2/)

# Modelisation

## Modelisation des convois

Nous avons deux templates differents pour les convois, soit un pour chaque direction du pont (ie: A et B).

Ces deux templates sont tres similaires et ne change que par leurs noms de variables, aucune logique ne differe entre l'un et l'autre.

![Convoi en direction de A](images/A.png)
![Convoi en direction de B](images/B.png)

##### Etat du modele

Pour des raisons de simplification du modele, nos convois ne disposent que de 3 etats :

 - EnTransit : Le convoi est en chemin vers le pont
 - EnAttente : Le convoi attend de pouvoir passer sur le pont
 - SurPont : Le convoi travers sur le pont
 
Chaque convoi qui fini une traverse du pont ce met instantanement en transit vers ce meme pont, toujours dans la meme direction (imaginons une grand boucle passant par un autre pont) et relance une requete pour simuler plus de trafic.

##### Transition : EnTransit -> EnAttente

Le convoi effectue ce changement d'etat en :
 - Initialisant une horloge systeme "tempsAttente" nous permettant de voir le temps que celui-ci attend pour passer sur le pont.
 - En envoyant une requete de passage sur un canal de communication avec le gestionnaire de requete.
 
##### Transition : EnAttente -> SurPont

Le convoi effectue ce changement d'etat en :
 - Verifiant qu'il a bien recu une "validation" de passage
 - En mettant a jour une variable global du nombre de camion sur le pont
 - En informant de son engagement sur le pont sur un canal de communication.

##### Transition : SurPont -> EnTransit

Le convoi effectue ce changement d'etat en :
 - Recevant un message disant que le convoi a fini sa traverse et ne gene plus la circulation.


## Modelisation du gestionnaire de requete

Notre systeme dispose d'un gestionnaire de requete en charge de l'enregistrement et du classement des requetes de passage sur le pont.

![Gestionnaire de requete](images/RequestManager.png)

Ce systeme est assez simple puisqu'il ne fait que recevoir des requetes des convois en direction de A ou B et les ajouter dans une liste ordonnee.

```
// Ajoute un nouveau convoi fournis en argument dans le tampon de requete A
void enqueueA(int element)
{
       reqOrderA[reqOrderALen++] = element;
}

// Ajoute un nouveau convoi fournis en argument dans le tampon de requete B
void enqueueB(int element)
{
       reqOrderB[reqOrderBLen++] = element;
}
```


## Modelisation du controleur de pont

Le controleur de pont est en charge d'accepter les requetes de passage recu de maniere a dispatcher le droit de passage aux differents convois en attente.

![Controleur de pont](images/CtrlP.png)

Bien que ce soit notre template le plus complexe, celui-ci est en verite assez simple et ce lis en symetrie.

1. Le controleur verifie si il y a des requetes d'une ou plusieurs direction:
   - Si il n'y a qu'une direction ayant fait une requete, il laisse passer le prochain convoi de cette direction.
   - Si il y a deux directions ayant fait des requetes il laisse passer la direction ayant le plus attendu jusqu'a maintenant.
    
    ```
    // Regarde si il existe au moins un request dans un tableau de requete offert en argument
    bool AnyRequest(int array[N])
    {
        int i = 0;
            while (i < N)
            {
            if(array[i] != 0)
            {
                return true;
            }
            i++;
        }
        return false;
    }

    ```
2. Une fois le convoi choisi, il engage un vehicule sur le pont 
    
    ```
    // Engage le premier convoi du tampon A sur le pont (utilise dequeueA())
    void engageA()
    {
    	id = dequeueA();
        validA[id] = 1;	
        if(!direction)
        {
            direction = true;
            directionTimer = 0;
        }
    }
    
    // Supprime la premiere requete du tampon(buffer) de requete A
    int dequeueA()
    {
        int value = reqOrderA[0];
    
            int i = 0;
            reqOrderALen -= 1;
            while (i < reqOrderALen)
            {
                    reqOrderA[i] = reqOrderA[i + 1];
                    i++;
            }
            reqOrderA[i] = 0;
    
        return value;
    }
    ```
3. Lorsque le pont est vide, il indique au convoi que son passage est officiellement termine et il revoque son droit de passage actuel.
4. Le controleur ce met en attente de requete ou recommence son traitement.

## Modelisation du pont

Le template de pont represente le pont en lui meme et permet de gerer l'utilisation de la ressource (est-ce que le pont est deja occupe par un convoi ou non).

![Pont](images/Pont.png)

Le pont dispose d'une logique assez simple :

1. Le pont est initialement en attente (il est libre).
2. Lorsqu'un convoi s'engage sur le pont une horloge est initialise.
3. Le pont attend un temps defini par le nombre de camion du convoi en cours de passage avant de revenir en attente.
4. Le pont indique qu'il est de nouveau libre. 
 