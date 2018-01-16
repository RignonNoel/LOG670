!create Manageur : Manageur
!create A1 : Autoroute
!set A1.Nom := 'A1'
!set A1.Numero := 20
!create A2 : Autoroute
!set A2.Nom := 'A2'
!set A2.Numero := 15

!create Vehicule1 : Vehicule
!create Vehicule2 : Vehicule
!create Vehicule3 : Vehicule
!create Vehicule4 : Vehicule
!create Vehicule5 : Vehicule
!create Vehicule6 : Vehicule

!create Vehicule7 : Vehicule

!create Convoi1 : Convoi
!create Convoi2 : Convoi

!insert (Manageur, A1) into ManageurAutoroute
!insert (Manageur, A2) into ManageurAutoroute

!insert (Vehicule1,Convoi1) into convoiLeader
!insert (Vehicule2, Convoi2) into convoiLeader

!insert (Convoi1, Vehicule3) into convoiVehicules
!insert (Convoi1, Vehicule4) into convoiVehicules

!insert (Convoi2, Vehicule5) into convoiVehicules
!insert (Convoi2, Vehicule6) into convoiVehicules

!insert (A1, Vehicule7) into AutorouteVehicule

!insert (A1, Convoi1) into AutorouteConvoi
!insert (A2, Convoi2) into AutorouteConvoi




