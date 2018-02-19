insertElem(L,E,I,R) :- insert(L,E,1,I,R),!.

insert(L,E,N,N,[E|L]).
insert([H|T],E,I,N,R) :- I<N, I1 is I + 1, insert(T,E,I1,N,R1), append([H],R1,R).
