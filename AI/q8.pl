toh(S,D,H,0) :- !.
toh(S,D,H,N) :-
	N > 0, 
	N1 is N-1,
	toh(S,H,D,N1), 
	write(S), 
	write(' -> '),
	write(D), 
	nl,
	toh(H,D,S,N1). 
