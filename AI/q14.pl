/*
	Predicate sumList(List1, Sum)
				Calculates Sum of List1
				calls sum(List1, 0, Sum)
				Stores Result in Sum

	Predicate sum(L1, S1, S2)
				adds Head of L1 in S1 (Sum of previous elements)
	Base Case: rev([],S,S) when L1 is empty S1 is the sum
*/
sumList(L, S) :- sum(L, 0, S).

sum([],S,S).
sum([H|T],D,S) :- D1 is D+H, sum(T,D1,S). 

go :- 
	write('Enter List : '),
	read(X),
	sumList(X,S),
	write('Sum of List is : '),write(S),!

:-initialization(go).	
