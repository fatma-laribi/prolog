inconnu([],_,[]).
inconnu([T|Q],X,[T,X|QD]) :- inconnu(Q,X,QD).
inconnu([T|Q],X,[T|QD]) :- inconnu(Q,X,QD).

liste(_,[],[],[]).
liste(X,[Y|L],[Y|R1],R):-Y<X, liste(X,L,R1,R).
liste(X,[Y|L],R,[Y|R1]):-Y>=X, liste(X,L,R,R1).

concat([ ], L2, L2).
concat([X|L], L2, L4) :-concat(L,L2,L3), L4=[X|L3].

ordonner([],[]).
ordonner([X|L],M):- liste(X,L,R1,R2), ordonner(R1,M1), ordonner(R2,M2), concat(M1,[X|M2],M).

max_liste([],-1).
max_liste([X|L],M) :- max_liste(L,M2), M is max(X,M2).

nbocc(_,[],0).
nbocc(X,[Y|L],N) :- X==Y, nbocc(X,L,N2), N is N2+1.
nbocc(X,[Y|L],N) :- X=\=Y, nbocc(X,L,N).

existe(X,[X|_]).
existe(X,[Y|L]):- X=\=Y, nbocc(X,L,N), N>=1,!.
existepas(X,L):- nbocc(X,L,N), N==0,!.

redondance([],[]).
redondance([X|L],R):- existe(X,L), redondance(L,R).
redondance([X|L],[X|R1]):- existepas(X,L),redondance(L,R1).


pic(L) :- max_liste(L,M), nbocc(M,L,N), N>1,fail.
pic(L) :- max_liste(L,M), nbocc(M,L,N), N==1,!.

a(X):- b(X).
a(X):- c(X).
d(X):- a(X), not(c(X)).
f(X1,X2):- a(X1), d(X2).
f(X1,X2):- d(X1), b(X2),!.
b(100).
c(1000).

flatten([],[]).
flatten([X|L],Flatlist):- is_list(X), flatten(X,Flat3),flatten(L,Flat2),concat(Flat3,Flat2,Flatlist).
flatten([X|L],[X|Flat2]):-not(is_list(X)),flatten(L,Flat2).

longueur([ ],0).
longueur([_|L],N) :-longueur(L,M), N is M+1.

encode([],[]).
encode([X|L],R):- diviser(X,L,L1,L2),longueur(L1,N), encode(L2,R2),concat([[N,X]],R2,R),!.

diviser(X,[],[X],[]).
diviser(X,[Y|L],[Y|L3],L2):- X==Y, diviser(X,L,L3,L2).
diviser(X,[Y|L],[X],[Y|L]):- X\==Y.

pour(N,N,M,_):-N=<M.
pour(X,N,M,P) :-
    Inc is N+P,
    Inc =< M,
    pour(X,Inc,M,P).
pour(N,N,M,_):-N>M,fail.


deuxcarres(N):-pour(X,0,N,1),pour(Y,0,N,1), N is X*X+Y*Y, write("X="),write(X),write(", Y="), write(Y). 

ajout(nil, X, t(nil,X,nil)).

ajout(t(G, X, D), X, t(G, X, D) ).

ajout(t(G, R, D), X, t(Ag, R, D) ) :- X<R, ajout(G, X, Ag).

ajout(t(G, R, D), X, t(G,R,Ad)) :- X>R, ajout(D, X, Ad).

