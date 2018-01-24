fib(0,0).
fib(1,1).
fib(N, T) :- N >= 2, X is N-1, Y is N-2, fib(X,T1), fib(Y,T2), T is T1 + T2.
generateFib(X,N):-
	X=<N,
	fib(X,T),
	write(T),
	write(', '),
	X1 is X + 1,
	generateFib(X1, N).

go :- 
	write('Enter Number : '),
	read(X),
	write('Fibbonacci Series is : '),
	generateFib(0,X).

:-initialization(go).
