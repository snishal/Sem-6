fac(0,1).
fac(A,R) :- X is A-1, fac(X,R1), R is R1*A.

go :- 
	write('Enter Number : '),
	read(X),
	fac(X,R),
	write('Factorial is : '),
	write(R).

:-initialization(go).
