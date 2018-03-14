/*
	Predicate gcd(Param1, Param2, Param3)
				finds gcd of Param1 and Param2
				breaks into gcd(Param2, Param1 mod Param2, Param3)
				Result is stored in Param3
	Base Case gcd(Param1, 0, Param3)
				is called on next iteration when Param2 is multiple of Param1
				in that case gcd is the smaller 0f Param1 and Param2		  
*/
gcd(A,0,A) :- !. 
gcd(A,B,R) :- X is mod(A,B), gcd(B,X,R).

go :- 
	write('Enter 1st Number : '),
	read(X),
	write('Enter 2nd Number : '),
	read(Y),
	gcd(X,Y,R),
	write('GCD is : '),
	write(R).

:-initialization(go).
