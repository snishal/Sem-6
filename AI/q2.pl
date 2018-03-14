/*
	Predicate Max(Param1, Param2, Param3)
				finds Max of Param1 and Param2
				Result is stored in Param3		  
*/
max(A,B,R) :- A=<B, !, B=R.
max(A,_,A).

go :- 
	write('Enter 1st Number : '),
	read(X),
	write('Enter 2nd Number : '),
	read(Y),
	max(X,Y,R),
	write('Max is : '),
	write(R).

:-initialization(go).
