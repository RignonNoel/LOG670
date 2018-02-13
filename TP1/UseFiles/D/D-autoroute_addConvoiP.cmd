!create Manageur : Manageur

!create Conducteur1 : Conducteur
!create Camera1 : Camera

!create A1 : Autoroute
!set A1.Nom := 'A1'
!set A1.Numero := 20
!insert (Manageur, A1) into ManageurAutoroute

!create Vehicule1 : Vehicule
!set Vehicule1.Direction := 'B'
!insert (Vehicule1, Conducteur1) into vehiculeConducteur
!insert (A1, Vehicule1) into AutorouteVehicule

!create Vehicule2 : Vehicule
!set Vehicule2.Direction := 'B'
!insert (Vehicule2, Camera1) into vehiculeCamera
!insert (A1, Vehicule2) into AutorouteVehicule

!A1.addConvoi(Set{Vehicule1, Vehicule2}, Vehicule1)