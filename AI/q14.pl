sumList(L, S) :- sum(L, 0, S).

sum([],S,S).
sum([H|T],D,S) :- D1 is D+H, sum(T,D1,S). 

go :- 
	write('Enter List : '),
	read(X),
	sumList(X,S),
	write('Sum of List is : '),write(S),!

:-initialization(go).	
