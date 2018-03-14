/*
	Predicate pow(Param1, Param2, Param3)
				Calculates Param1 raise to Param2
				Breaks into Param1^Param2 = Param1 * Param1^Param2-1
				Stores Result in Param3

	Base Case: pow(Param1,0,1) : Anything raise to 0 is 1
*/
pow(B,0,1) :- !.
pow(B,E,R) :- E > 0, E1 is E-1, pow(B,E1,R1), R is R1*B.

go :- 
	write('Enter Base Number : '),
	read(X),
	write('Enter Exponential Number : '),
	read(Y),
	pow(X,Y,R),
	write('Result is : '),
	write(R).

:-initialization(go).
