/*
	edge(X,Y) are the facts that represent a given Graph i.e. edge exists in Graph from X to Y
	Predicate route(Param1, Param2)
				Checks if route exists from Param1 to Param2 in stored graph

	Base Case: route(X,Y) :- edge(X,Y),!. if there is a direct edge between X and Y, route exists
*/
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
	route(X,Y),
	write('Path Exists');
	write('Path Not Exists'),!.

:-initialization(go).	
