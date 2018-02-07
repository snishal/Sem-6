myrev(L, R) :- rev(L, [], R).
rev([],L,L).
rev([H|T], L1, R) :- append([H], L1, L2), rev(T, L2, R). 
