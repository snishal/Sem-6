:-dynamic(roomAvailable/2).
:-dynamic(roomAlloted/2).

roomAvailable(401,9).
roomAvailable(401,11).

roomAvailable(402,9).
roomAvailable(402,11).

demand('A', 9).
demand('B', 9).
demand('C', 9).
demand('D', 9).

allot([]).
allot([[X,Y]|T]) :- roomAvailable(Z,Y), retract(roomAvailable(Z,Y)), asserta(roomAlloted(X,Y,Z)), allot(T); roomAvailable(_,_), allot([[X|_]|T]).

demands(L) :- findall([X,Y], demand(X,Y), L).

schedule :- demands(L), allot(L), findall([X,Y,Z], roomAlloted(X,Y,Z), S), write(S), !.
