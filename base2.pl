lire(X) :- write('donner un entier '), nl, read(X), nl, write('votre entier est '),write(X),nl,nl.
calcul_carre(X,Y):- Y is X * X.
ecrire_resultat(X,Y) :- write('le carre de '), write(X), write(' est '),write(Y), nl,nl.
aller(X) :- lire(X), calcul_carre(X,Y), ecrire_resultat(X,Y).
loop :- aller(X), X==0 -> write('end of loop'); loop .
fact(0,1).
fact(N,X) :- N>0, N1 is N-1, fact(N1,X1), X is N*X1.
