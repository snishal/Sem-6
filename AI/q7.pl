mul(X,0,X) :- !.
mul(X,1,X) :- !.
mul(X,Y,R) :- Y>1, Y1 is Y-1, mul(X,Y1,R1), R is R1+X. 

go :- 
	write('Enter 1st Number : '),
	read(X),
	write('Enter 2nd Number : '),
	read(Y),
	mul(X,Y,R),
	write('Result is : '),
	write(R).

:-initialization(go).
