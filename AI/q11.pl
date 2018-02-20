conc([], L2, L2).
conc([X|L1], L2, [X|L3]) :- conc(L1, L2, L3).

go :- 
	write('Enter 1st List : '),
	read(X),
	write('Enter 2nd LIst : '),
	read(Y),
	conc(X,Y,R),
	write('Concatenated List is'),write(R),!.

:-initialization(go).	
