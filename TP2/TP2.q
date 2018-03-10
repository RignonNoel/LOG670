//This file was generated from (Commercial) UPPAAL 4.0.14 (rev. 5615), May 2014

/*
P1 : Il n\u2019y a pas de \u00ab deadlock \u00bb
*/
A[] not deadlock

/*
P2 : Il n\u2019y a pas de collision (i.e. deux convois circulants en sens inverse) sur le pont.
*/
A[] (DirectionA1.SurPont || DirectionA2.SurPont || DirectionA3.SurPont) imply not (DirectionB1.SurPont || DirectionB2.SurPont || DirectionB3.SurPont)

/*
P3 : Le pont est juste et \u00e9quitable (= \u00ab fair \u00bb).
*/
(DirectionA1.SurPont || DirectionA2.SurPont || DirectionA3.SurPont) --> (DirectionB1.SurPont || DirectionB2.SurPont || DirectionB2.SurPont)

/*
P4 : Un convoi qui arrive est certain de passer sur le pont \u00e0 l\u2019issue d\u2019une dur\u00e9e born\u00e9e.
*/
//NO_QUERY

/*
P5 : Lorsqu'un convoi entre sur le pont, il en ressort.
*/
Pont.ConvoiSurPont --> Pont.Sortie
