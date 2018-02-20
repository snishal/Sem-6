gcd(A,0,A) :- !.
gcd(A,B,R) :- X is mod(A,B), gcd(B,X, R).

go :- 
	write('Enter 1st Number : '),
	read(X),
	write('Enter 2nd Number : '),
	read(Y),
	gcd(X,Y,R),
	write('GCD is : '),
	write(R).

:-initialization(go).
