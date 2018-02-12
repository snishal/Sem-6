memberOf(X, [X|_]) :- !.
memberOf(X, [_|Y]) :- memberOf(X, Y).

conc([], L2, L2).
conc([X|L1], L2, [X|L3]) :- conc(L1, L2, L3).

remove_dup([],[]) :- !.
remove_dup([H|T], R) :- memberOf(H,T), remove_dup(T,R).
remove_dup([H|T], [H|T1]) :- \+(memberOf(H,T)),remove_dup(T,T1).




