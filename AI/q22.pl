delete_all(N,[],[]) :- !.
delete_all(N,[N|T],R) :- delete_all(N,T,R1), append([],R1,R),!.
delete_all(N,[H|T],R):- delete_all(N,T,R1), append([H],R1,R),!.
