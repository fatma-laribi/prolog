longueur([],0).
longueur([_|L],S):- longueur(L,S2), S is S2+1.

somme([],0).
somme([X2|L],S) :- somme(L,S2), S is X2+S2.