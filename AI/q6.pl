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
