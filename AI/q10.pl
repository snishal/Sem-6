memberOf(X, [X|_]) :- !.
memberOf(X, [_|Y]) :- memberOf(X, Y).
