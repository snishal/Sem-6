/*
	Predicate myrev(List1, List2)
				Finds reverse of List1
				calls rev(List1, [], List2)
				Stores Result in List2

	Predicate rev(L1, L2, L3)
				appends Head of L1 to L2 and recursively calls itself
	Base Case: rev([],L,L) when L1 is empty L2 is the reversed List
*/
myrev(L, R) :- rev(L, [], R).
rev([],L,L).
rev([H|T], L1, R) :- append([H], L1, L2), rev(T, L2, R). 

go :- 
	write('Enter List : '),
	read(X),
	myrev(X,Y),
	write('Reverse is : '), write(Y),!.

:-initialization(go).	
