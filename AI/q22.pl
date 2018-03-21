/*
	Predicate delete_all(N,List1, List2) delete all occurence of N from List1 to form List2
				if N is Head of List1, then List2 is delete_all N from Tail of List1
				else List2 is Head of List1 and delete_all N from Tail of List1
				
	BaseCase: delete_all(N,[],[]) Delete N from empty list yields empty list
*/
delete_all(N,[],[]).
delete_all(N,[N|T],R1) :- delete_all(N,T,R1).
delete_all(N,[H|T],[H|R1]):- delete_all(N,T,R1).

go :- 
	write('Enter List : '),
	read(X),
	write('Enter N : '),
	read(N),
	delete_all(N,X,Y),	
	write('Result List is : '),write(Y),!.

:-initialization(go).	
