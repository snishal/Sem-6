edge('p','q').
edge('q','r').
edge('q','s').
edge('s','t').

route(X,Y) :- edge(X,Y),!.
route(X,Y) :- 
	edge(X,Z),
	route(Z,Y).	
