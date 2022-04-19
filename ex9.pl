separer([X],[X],[]).
separer([],[],[]).
separer([X,Y|L],[X|L3],[Y|L4]) :- separer(L,L3,L4).


fusionner([],L,L).
fusionner(L,[],L).
fusionner([X|L1],[Y|L2],[X|L3]) :- X<Y,fusionner(L1,[Y|L2],L3).
fusionner([X|L1],[Y|L2],[Y|L3]) :- X>Y,fusionner([X|L1],L2,L3).

trier([],[]).
trier([X],[X]).
trier(L,LL):- separer(L,L1,L2),trier(L1,LL1), trier(L2,LL2), fusionner(LL1,LL2,LL3),LL=LL3.