boucle(0,0,0).
boucle(N,S,MAX):- N>0, write('saisir entier '),nl, read(X) , A is  N-1,  boucle(A,B,MAX2), S is X+B  , MAX is max(X,MAX2).