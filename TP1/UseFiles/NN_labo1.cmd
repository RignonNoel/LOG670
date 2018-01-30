!create Manageur : Manageur

!create Conducteur1 : Conducteur
!create Conducteur2 : Conducteur
!create Conducteur3 : Conducteur
!create Sonar1 : Sonar
!create Sonar2 : Sonar
!create Camera1 : Camera
!create Camera2 : Camera
!create Camera3 : Camera

!create A1 : Autoroute
!set A1.Nom := 'A1'
!set A1.Numero := 20
!insert (Manageur, A1) into ManageurAutoroute

!create A2 : Autoroute
!set A2.Nom := 'A2'
!set A2.Numero := 15
!insert (Manageur, A2) into ManageurAutoroute

!create Convoi1 : Convoi
!insert (A1, Convoi1) into AutorouteConvoi

!create Convoi2 : Convoi
!insert (A2, Convoi2) into AutorouteConvoi

!create Vehicule1 : Vehicule
!set Vehicule1.Direction := 'A'
!insert (Vehicule1,Convoi1) into convoiLeader
!insert (Convoi1, Vehicule1) into convoiVehicules
!insert (Vehicule1, Conducteur1) into vehiculeConducteur

!create Vehicule2 : Vehicule
!set Vehicule2.Direction := 'B'
!insert (Convoi2, Vehicule2) into convoiVehicules
!insert (Vehicule2, Camera1) into vehiculeCamera
!insert (Vehicule2, Conducteur2) into vehiculeConducteur

!create Vehicule3 : Vehicule
!set Vehicule3.Direction := 'A'
!insert (Convoi1, Vehicule3) into convoiVehicules
!insert (Vehicule3, Conducteur3) into vehiculeConducteur

!create Vehicule4 : Vehicule
!set Vehicule4.Direction := 'A'
!insert (Convoi1, Vehicule4) into convoiVehicules
!insert (Vehicule4, Sonar1) into vehiculeSonar

!create Vehicule5 : Vehicule
!set Vehicule5.Direction := 'A'
!insert (Convoi1, Vehicule5) into convoiVehicules
!insert (Vehicule5, Sonar2) into vehiculeSonar

!create Vehicule6 : Vehicule
!set Vehicule6.Direction := 'B'
!insert (Vehicule6,Convoi2) into convoiLeader
!insert (Convoi2, Vehicule6) into convoiVehicules
!insert (Vehicule6, Camera2) into vehiculeCamera

!create Vehicule7 : Vehicule
!set Vehicule7.Direction := 'B'
!insert (Vehicule7, Camera3) into vehiculeCamera
!insert (A1, Vehicule7) into AutorouteVehicule
