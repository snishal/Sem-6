toh(S,D,H,N) :-
	N > 0, 
	N1 is N-1,
	toh(S,H,D,N1), 
	write(S), 
	write(' -> '),
	write(D), 
	nl,
	toh(H,D,S,N1). 

go :- 
	write('Enter Number of Disks : '),
	read(X),
	toh('a','b','c',X);write('Enter Valid Number of Disks'),!.

:-initialization(go).
