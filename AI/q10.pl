memberOf(X, [X|_]) :- !.
memberOf(X, [_|Y]) :- memberOf(X, Y).

go :- 
	write('Enter List : '),
	read(X),
	write('Enter Element : '),
	read(Y),
	memberOf(Y,X),
	write('Element Found');
	write('Element Not Found'),!

:-initialization(go).	
