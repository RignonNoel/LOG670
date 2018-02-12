!create Manageur : Manageur

!create Conducteur1 : Conducteur
!create Camera1 : Camera

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

!create Vehicule2 : Vehicule
!set Vehicule2.Direction := 'B'
!insert (Vehicule2, Camera1) into vehiculeCamera
!insert (A1, Vehicule2) into AutorouteVehicule

!create Vehicule3 : Vehicule
!set Vehicule3.Direction := 'B'
!insert (A1, Vehicule3) into AutorouteVehicule
