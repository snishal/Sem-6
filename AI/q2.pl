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
