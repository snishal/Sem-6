deleteElem(L,I,R) :- deleteT(L,1,I,R),!.

deleteT([H|T],N,N,T).
deleteT([H|T],I,N,R) :- I<N, I1 is I + 1, deleteT(T,I1,N,R1), append([H],R1,R).
