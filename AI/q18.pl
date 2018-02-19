maxList([H|T],M) :- findMax(T,H,M),!.

findMax([],M,M).
findMax([H|T],M1,M):- H=<M1, findMax(T,M1,M).
findMax([H|T],_,M):- findMax(T,H,M).
