gcd(A,0,A) :- !.
gcd(A,B,R) :- X is mod(A,B), gcd(B,X, R).

