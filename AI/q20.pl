subList([],_) :- !.
subList([H1|T1], [H1|T2]) :- subList(T1, T2),!.
subList(X, [_|T2]) :- subList(X, T2),!.
