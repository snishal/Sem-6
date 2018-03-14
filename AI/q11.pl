/*
	Predicate conc(List1, List2, List3)
				Concatenates List1 and List2 
				Breaks into conc(Tail of List1, List2, List3) and appends Head of List1 into List3 								
				Stores Result in List3

	Base Case: conc([], L2, L2) if List1 is empty then concatenation is List2 itself
*/
conc([], L2, L2):-!.
conc([X|L1], L2, [X|L3]) :- conc(L1, L2, L3).

go :- 
	write('Enter 1st List : '),
	read(X),
	write('Enter 2nd LIst : '),
	read(Y),
	conc(X,Y,R),
	write('Concatenated List is'),write(R),!.

:-initialization(go).	
