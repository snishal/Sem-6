/*
	Predicate Sum(Param1, Param2, Param3)
				Calculates Sum of Param1 and Param2
				Result is stored in Param3		  
*/
sum(A,B,R) :- R is A + B.  

go :- 
	write('Enter 1st Number : '),
	read(X),
	write('Enter 2nd Number : '),
	read(Y),
	sum(X,Y,R),
	write('Result is : '),
	write(R).

:-initialization(go).
