/*
	Predicate even(List) Length of List is even if Tail's Length is odd
	Base Case: even([]) empty list is even in length	

	Predicate odd(List) Length of List is odd if Tail's Length is even
	Base Case: odd([X]) single element list is odd in length
*/
even([]) :- !.
even([_|T]) :- odd(T).
odd([X]) :- !.    
odd([_|T]) :- even(T).


