!create Manageur : Manageur

!create Conducteur1 : Conducteur
!create Conducteur2 : Conducteur
!create Conducteur3 : Conducteur
!create Camera1 : Camera
!create Camera2 : Camera

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
!insert (Vehicule1, Camera1) into vehiculeCamera
!insert (Vehicule1, Conducteur3) into vehiculeConducteur

!create Vehicule2 : Vehicule
!set Vehicule2.Direction := 'B'
!insert (Convoi1, Vehicule2) into convoiVehicules
!insert (Vehicule2, Camera2) into vehiculeCamera

!create Vehicule3 : Vehicule
!set Vehicule3.Direction := 'B'
!insert (Vehicule3,Convoi2) into convoiLeader
!insert (Convoi2, Vehicule3) into convoiVehicules
!insert (Vehicule3, Conducteur1) into vehiculeConducteur

!create Vehicule4 : Vehicule
!set Vehicule4.Direction := 'A'
!insert (Convoi2, Vehicule4) into convoiVehicules
!insert (Vehicule4, Conducteur2) into vehiculeConducteur