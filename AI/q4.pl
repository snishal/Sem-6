/*
	Predicate fib(Param1, Param2)
				Calculates Fibbonacci Term of Param1
				Stores Result in Param2

	Base Case: fib(0,0) : 0th term of Fibbonacci Series is 0.
	Base Case: fib(1,1) : 1st term of Fibbonacci Series is 1.

	Predicate generateFib(Param1, Param2)
				Loops to print Fibbonacci Series
				Loops Until Param1 is less than Param2
				Calls fib to get Nth term and prints it
			Starts from 0 goes to N-1
*/

fib(0,0). 
fib(1,1).
fib(N, T) :- N >= 2, X is N-1, Y is N-2, fib(X,T1), fib(Y,T2), T is T1 + T2.

generateFib(X,N):-
	X<N,
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
