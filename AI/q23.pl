/*
	Predicate merge(List1, List2, List3) merge ordered List1 and List2 to form List3
				if Head of List1 is less than or equal to Head of List2, List3 is Head of List1 + merge of Tail of List1, List2
				else List3 is Head of List2 + merge of Tail of List2, List1 
	BaseCase: merge(L,[],L) if List2 is empty List3 is List1 
			  merge([],L,L) if List1 is empty List3 is List2
*/
merge(L,[],L).
merge([],L,L).
merge([H1|T1],[H2|T2],[H1|R]) :- H1 =< H2, merge(T1, [H2|T2], R).
merge([H1|T1],[H2|T2],[H2|R]) :- merge([H1|T1], T2, R).

go :- 
	write('Enter List1 : '),
	read(X),
	write('Enter List2 : '),
	read(Y),
	merge(X,Y,R),	
	write('Result List is : '),write(R),!.

:-initialization(go).	
