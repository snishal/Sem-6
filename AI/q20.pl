/*
	Predicate subList(List1, List2) checks if List1 is sublist of List2
				if Head of List1 and List2 are same check if Tail of List1 is sublist of Tail of List2
				else List1 is sublist of Tail of List2
	
	BaseCase: subList([],_) Empty list is sublist of every list	
*/
subList([],_) :- !.
subList([H1|T1], [H1|T2]) :- subList(T1, T2),!.
subList(X, [_|T2]) :- subList(X, T2),!.

go :- 
	write('Enter List : '),
	read(X),
	write('Enter Check Sublist : '),
	read(Y),
	subList(Y,X),	
	write('Is SubList'),!.

:-initialization(go).	
