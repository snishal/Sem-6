/*
	Predicate deleteElem(List1, Index, List2) delete Element in List1 at Index to form List2
				calls delete(List, 1, Index, List2)

	delete(L1, CurrentIndex, Index, List2) :- if CurrentIndex is less than Index delete in Tail of L1 and Increment Current Index
	Base Case: remove(L, I, I, List2) If current index is equal to Index List2 is Tail of L i.e. delete Element
*/
deleteElem(L,I,R) :- deleteT(L,1,I,R),!.

deleteT([H|T],N,N,T).
deleteT([H|T],I,N,R) :- I<N, I1 is I + 1, deleteT(T,I1,N,R1), append([H],R1,R).

go :- 
	write('Enter List : '),
	read(X),
	write('Enter Index : '),
	read(I),
	deleteElem(X,I,R),
	write('Updated List is : '),write(R),!.

:-initialization(go).	
