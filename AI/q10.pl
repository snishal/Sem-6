/*
	Predicate memberOf(Param1, Param2)
				Checks if Param1 is a meber of List Param2
				Breaks into checking if Param1 is either Head of Param2
							or memberof(Param1, Tail of Param2)

	Base Case: memberOf(X, [X|_]) X is member of List when X is head of the list
*/
memberOf(X, [X|_]).
memberOf(X, [_|Y]) :- memberOf(X, Y).

go :- 
	write('Enter List : '),
	read(X),
	write('Enter Element : '),
	read(Y),
	memberOf(Y,X),
	write('Element Found');
	write('Element Not Found'),!.

:-initialization(go).	
