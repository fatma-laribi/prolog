elements_pairs([],[]).
elements_pairs([X|L],X|LR1) :- 0 is mod(X,2), elements_pairs(L,LR1).
elements_pairs([X|L],LR):- 1 is mod(X,2),elements_pairs(L,LR).