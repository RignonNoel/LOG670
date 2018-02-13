!create Manageur : Manageur

!create Conducteur1 : Conducteur
!create Camera1 : Camera
!create Camera2 : Camera

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
!set Vehicule2.Direction := 'A'
!insert (Convoi1, Vehicule2) into convoiVehicules
!insert (Vehicule2, Camera2) into vehiculeCamera

!create Vehicule3 : Vehicule
!set Vehicule3.Direction := 'A'
!insert (Vehicule3, Camera1) into vehiculeCamera
!insert (Convoi1, Vehicule3) into convoiVehicules
!insert (A1, Vehicule1) into AutorouteVehicule

