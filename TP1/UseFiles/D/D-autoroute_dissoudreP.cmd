!create Manageur : Manageur

!create Conducteur1 : Conducteur
!create Conducteur2 : Conducteur
!create Sonar1 : Sonar
!create Sonar2 : Sonar

!create A1 : Autoroute
!set A1.Nom := 'A1'
!set A1.Numero := 20
!insert (Manageur, A1) into ManageurAutoroute

!create Convoi1 : Convoi
!insert (A1, Convoi1) into AutorouteConvoi

!create Vehicule1 : Vehicule
!set Vehicule1.Direction := 'A'
!insert (Vehicule1,Convoi1) into convoiLeader
!insert (Convoi1, Vehicule1) into convoiVehicules
!insert (Vehicule1, Conducteur1) into vehiculeConducteur

!create Vehicule3 : Vehicule
!set Vehicule3.Direction := 'A'
!insert (Convoi1, Vehicule3) into convoiVehicules
!insert (Vehicule3, Conducteur2) into vehiculeConducteur

!create Vehicule4 : Vehicule
!set Vehicule4.Direction := 'A'
!insert (Convoi1, Vehicule4) into convoiVehicules
!insert (Vehicule4, Sonar1) into vehiculeSonar

!create Vehicule5 : Vehicule
!set Vehicule5.Direction := 'A'
!insert (Convoi1, Vehicule5) into convoiVehicules
!insert (Vehicule5, Sonar2) into vehiculeSonar

!A1.dissoudre(Convoi1)