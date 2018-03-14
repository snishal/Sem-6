/*
	Predicate insertElem(List1, Element, Index, List2) insert Element in List1 at Index to form List2
				calls insert(List, Element, 1, Index, List2)

	insert(L1, Element, CurrentIndex, Index, List2) :- if CurrentIndex is less than Index insert in Tail of L1 and Increment Current Index
	Base Case: remove(L, E, I, I, List2) If current index is equal to Index append E in L
*/
insertElem(L,E,I,R) :- insert(L,E,1,I,R),!.

insert(L,E,N,N,[E|L]).
insert([H|T],E,I,N,[H|R1]) :- I<N, I1 is I + 1, insert(T,E,I1,N,R1)

go :- 
	write('Enter List : '),
	read(X),
	write('Enter Number to Insert : '),
	read(N),
	write('Enter Index to Insert : '),
	read(I),
	nElem(X,N,I,Y),	
	write('Updated List is : '),write(Y),!

:-initialization(go).
