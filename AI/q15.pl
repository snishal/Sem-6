even([]) :- !.
even([_|T]) :- odd(T).
odd([X]) :- !.    
odd([_|T]) :- even(T).
