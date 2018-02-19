<<<<<<< HEAD
nElem(L,N,R) :- find(L,1,N,R).

find([H|_],X,X,R) :- R is H, !.
find([_|T],I,N,R) :- I < N, I1 is I + 1, find(T,I1,N,R).
=======
nElem(L,N,R) :- find(L,1,N,R),!.

find([H|_],N,N,H).
find([_|T],I,N,R):- I<N, I1 is I + 1, find(T,I1,N,R).
>>>>>>> 4401c9851d8de33d2865833815e824dd5fdcca7a
