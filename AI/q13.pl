/*
	Predicate pal(List1)
				Checks of List1 is a Pallindrome using reverse 
				if List1 is its reverse than List1 is pallindrome else not
*/
myrev(L, R) :- rev(L, [], R).
rev([],L,L).
rev([H|T], L1, R) :- append([H], L1, L2), rev(T, L2, R). 
pal(X) :- myrev(X,X).

go :- 
	write('Enter List : '),
	read(X),
	pal(X),
	write('Is a Pallindrome');
	write('Not Pallindrome'),!.

:-initialization(go).	 
