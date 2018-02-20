even([]) :- !.
even([_|T]) :- odd(T).
odd([X]) :- !.    
odd([_|T]) :- even(T).

go :- 
	write('Enter List : '),
	read(X),
	sumList(X,S),
	write('Sum of List is : '),write(S),!

:-initialization(go).	
