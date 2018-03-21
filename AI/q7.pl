/*
	Predicate mul(Param1, Param2, Param3)
				Calculates Param1 * Param2 using successive addition
				Breaks into Param1 * Param2 = Param1 + Param1*Param2-1
				Stores Result in Param3

	Base Case: mul(Param1,0,0) : Anything multiplied to 0 is 0
*/
mul(X,0,0) :- !.
mul(X,Y,R) :- Y>=1, Y1 is Y-1, mul(X,Y1,R1), R is R1+X. 

go :- 
	write('Enter 1st Number : '),
	read(X),
	write('Enter 2nd Number : '),
	read(Y),
	mul(X,Y,R),
	write('Result is : '),
	write(R).

:-initialization(go).
