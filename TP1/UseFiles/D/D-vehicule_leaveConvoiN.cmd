!create Manageur : Manageur

!create Conducteur1 : Conducteur
!create Conducteur2 : Conducteur

!create A1 : Autoroute
!set A1.Nom := 'A1'
!set A1.Numero := 20
!insert (Manageur, A1) into ManageurAutoroute

!create Convoi1 : Convoi
!insert (A1, Convoi1) into AutorouteConvoi

!create Convoi2 : Convoi
!insert (A1, Convoi2) into AutorouteConvoi

!create Vehicule1 : Vehicule
!set Vehicule1.Direction := 'A'
!insert (Vehicule1,Convoi1) into convoiLeader
!insert (Convoi1, Vehicule1) into convoiVehicules
!insert (Vehicule1, Conducteur1) into vehiculeConducteur

!create Vehicule2 : Vehicule
!set Vehicule2.Direction := 'A'
!insert (Vehicule2, Convoi2) into convoiLeader
!insert (Convoi2, Vehicule2) into convoiVehicules
!insert (Vehicule2, Conducteur2) into vehiculeConducteur

!Vehicule2.leaveConvoi()