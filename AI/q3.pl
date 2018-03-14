/*
	Predicate fac(Param1, Param2)
				Calculates Factorial of Param1
				Stores Result in Param2

	Base Case: fac(0,1) : Factorial of 0 is 1.
*/
fac(0,1).
fac(A,R) :- X is A-1, fac(X,R1), R is R1*A.

go :- 
	write('Enter Number : '),
	read(X),
	fac(X,R),
	write('Factorial is : '),
	write(R).

:-initialization(go).
