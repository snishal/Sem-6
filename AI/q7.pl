mul(X,0,X) :- !.
mul(X,1,X) :- !.
mul(X,Y,R) :- Y>1, Y1 is Y-1, mul(X,Y1,R1), R is R1+X. 

