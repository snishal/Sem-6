edge('p','q').
edge('q','r').
edge('q','s').
edge('s','t').

route(X,Y) :- edge(X,Y),!.
route(X,Y) :- 
	edge(X,Z),
	route(Z,Y).

go :- 
	write('Enter 1st Node : '),
	read(X),
	write('Enter 2nd Node : '),
	read(Y),
	path(X,Y,R),
	write('Path Exists');
	write('Path Not Exists'),!

:-initialization(go).	
