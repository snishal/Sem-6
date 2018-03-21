exec('N') :- write('Exit'), nl.
exec(1) :- [q1], run.
exec(2) :- [q2], run.
exec(3) :- [q3], run.
exec(4) :- [q4], run.
exec(5) :- [q5], run.
exec(6) :- [q6], run.
exec(7) :- [q7], run.
exec(8) :- [q8], run.
exec(9) :- [q9], run.
exec(10) :- [q10], run.
exec(11) :- [q11], run.
exec(12) :- [q12], run.
exec(13) :- [q13], run.
exec(14) :- [q14], run.
exec(15) :- [q15], run.
exec(16) :- [q16], run.
exec(17) :- [q17], run.
exec(18) :- [q18], run.
exec(19) :- [q19], run.
exec(20) :- [q20], run.
exec(21) :- [q21], run.
exec(22) :- [q22], run.
exec(23) :- [q23], run.
exec(_) :- write('Enter a valid choice'), run.

run :- 
	write('1.Sum of two numbers.'), nl,
	write('2.Maximum of two numbers.'), nl,
	write('3.Factorial of a Number.'), nl,
	write('4.Generate Fibonacci Series.'), nl,
	write('5.GCD of two numbers.'), nl,
	write('6.Nth power of a Number.'), nl,
	write('7.Multiplication of two numbers.'), nl,
	write('8.Tower of Hanoi.'), nl,
	write('9.Check route in a graph from one node to other.'), nl,
	write('10.Check member in a List.'), nl,
	write('11.Concatenate two Lists.'), nl,
	write('12.Reverse a List.'), nl,
	write('13.Check if List is a Pallindrome.'), nl,
	write('14.Compute sum of a List.'), nl,
	write('15.Check if List is odd or even in length.'), nl,
	write('16.Find Nth element of List.'), nl,
	write('17.Remove duplicate from a List.'), nl,
	write('18.Find maximum of a List.'), nl,
	write('19.Insert element in a List.'), nl,
	write('20.Check Sublist of a List.'), nl,
	write('21.Delete Nth element from List.'), nl,
	write('22.Delete all occurrences of element from List.'),
	write('23.Merge two ordered list to form ordered List.'), nl,
	write('Press N to exit'), nl,
	write('Enter Your Choice : '),
	read(C),
	exec(C).

:- initialization(run).

initialization(run).
