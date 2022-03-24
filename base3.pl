personne(k,f,85,tunis).
personne(c,m,63,nabeul).
personne(d,f,60,nabeul).
personne(e,m,35,tunis).
personne(g,f,27,sousse).
personne(h,f,39,nabeul).
personne(i,m,40,nabeul).
personne(j,m,17,sousse).
personne(1,f,9,sousse).
personne(m,f,19,tunis).
personne(n,m,1,tunis).

personne2(k,f,85,tunis,24000,medecin).
personne2(c,m,63,nabeul,15000, plombier).
personne2(d,f,85,tunis,20000,medecin).

a_la_meme_prof(X,Y) :- personne2(X,_,_,_,_,A1), personne2(Y,_,_,_,_,A2), A1==A2, X \== Y.
gagne_plus(X,Y) :- personne2(X,_,_,_,A1,_), personne2(Y,_,_,_,A2,_), A1 > A2, X \== Y.
meme_ordre(X,Y) :- personne2(X,_,_,_,A1,_), personne2(Y,_,_,_,A2,_), X \== Y, (A2-A1)/A2 < 0.2, (A2-A1)/A2 > -0.2 .
individu(X) :- personne(X,_,_,_).
masculin(X) :- personne(X,m,_,_).
feminin(X) :- personne(X,f,_,_).
est_age_de(X,Y) :- personne(X,_,Y,_) .
habite_a(X,Y) :- personne(X,_,_,Y).
majeur(X) :- personne(X,_,A,_), A>=18.
mineur(X) :- personne(X,_,A,_), A<18.
meme_age(X,Y) :- personne(X,_,A1,_), personne(Y,_,A2,_), A1 =:= A2 , X \== Y .
habite_la_meme_ville(X,Y) :- personne(X,_,_,V1), personne(Y,_,_,V2), V1 == V2, X \== Y.
epoux_possible(X,Y) :-personne(X,m,A1,_),personne(Y,f,A2,_),majeur(X),majeur(Y),A1-A2 <20, A1-A2 > -20.