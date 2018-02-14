memberOf(X, [X|_]) :- !.
memberOf(X, [_|Y]) :- memberOf(X, Y).

remove_dup(L, R) :- remove(L, [], R),!.

remove([], R, R).
remove([H|T], L1, R) :- memberOf(H, L1), remove(T, L1, R).
remove([H|T], L1, R) :- remove(T, [H|L1], R).




