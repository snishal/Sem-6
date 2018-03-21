/*
	Predicate maxList(List1, Max) finds Max of List1
				Stores in Max
				calls findMax(Tail of List1, Head of List1(conserding it to be Max), Max)

	findMax(L1, M1, M2) :- Checks if Head of L1 is less than M1(Max of Scanned List) do nothing else update M1 with H
						   Call findMax(Tail of L1, M1, M2)
						  call remove for tail of L1
	Base Case: remove([], M, M) M is Max of List
*/
maxList([H|T],M) :- findMax(T,H,M),!.

findMax([],M,M).
findMax([H|T],M1,M):- H=<M1, findMax(T,M1,M).
findMax([H|T],_,M):- findMax(T,H,M).

go :- 
	write('Enter List : '),
	read(X),
	maxList(X,N),	
	write('MAx of List is : '),write(N),!.

:-initialization(go).	
