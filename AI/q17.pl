/*
	Predicate remove_dup(List1, List2) remove duplicates from List1
				Stores in List2
				calls remove(L1, [], L2)

	remove(L1, L2, L3) :- Checks if Head of L1 is memberOf L2(Current List without duplicate) if not append it to L2 else not
						  call remove for tail of L1
	Base Case: remove([], R, R) When L1 is empty L2 is List with non duplicates 
*/
memberOf(X, [X|_]) :- !.
memberOf(X, [_|Y]) :- memberOf(X, Y).

remove_dup(L, R) :- remove(L, [], R),!.

remove([], R, R).
remove([H|T], L1, R) :- memberOf(H, L1), remove(T, L1, R).
remove([H|T], L1, R) :- remove(T, [H|L1], R).

go :- 
	write('Enter List : '),
	read(X),
	remove_dup(X,R),
	write('Remove Duplicate List is : '),write(R),!.

:-initialization(go).	




