adjacent(a,b).
adjacent(a,d).
adjacent(a,c).
adjacent(b,e).
adjacent(b,a).
adjacent(b,c).
adjacent(e,d).
adjacent(e,b).
adjacent(e,c).
adjacent(d,a).
adjacent(d,e).
adjacent(d,c).

color(a,bleu,coloriage1).
color(b,vert,coloriage1).
color(d,vert,coloriage1).
color(c,rouge,coloriage1).
color(e,bleu,coloriage1).

color(a,rouge,coloriage2).
color(b,vert,coloriage2).
color(d,vert,coloriage2).
color(c,rouge,coloriage2).
color(e,bleu,coloriage2).

conflit(X,Y,Coloriage) :- adjacent(X,Y), color(X,Z,Coloriage), color(Y,Z,Coloriage).
conflit(Coloriage) :- conflit(_,_,Coloriage).