:-dynamic(roomAvailable/2).
:-dynamic(roomAlloted/3).
:-dynamic(demand/2).

roomAvailable(401,9).
roomAvailable(401,11).

roomAvailable(402,9).
roomAvailable(402,11).

inputloop(0).
inputloop(I) :- I>0,
	       write('Name of the teacher: '), read(Name),
	       write(' Time: '), read(Time), nl,
	       assertz(demand(Name,Time)),
	       N is I-1, inputloop(N).

allot([], CRemain, CRemain).
allot([[Name,Time]|Tail], CRemain, FRemain) :- roomAvailable(Room,Time), retract(roomAvailable(Room,Time)), assertz(roomAlloted(Name,Room,Time)), allot(Tail, CRemain, FRemain).
allot([[Name,_]|Tail], CRemain, FRemain) :- append(CRemain, [[Name, _]], NCRemain), allot(Tail, NCRemain, FRemain).

demands(Demands) :- findall([Name,Time], demand(Name,Time), Demands).

output([]).
output([[Name,Time,Room]|Tail]) :- format('Teacher: ~w Time: ~w Room:  ~w', [Name,Time,Room]), nl, output(Tail).

schedule :- write('Enter the number of demands: '), read(D), inputloop(D),
	    demands(L),
	    allot(L, [], Remaining),
	    allot(Remaining, [], []),
	    findall([X,Y,Z], roomAlloted(X,Y,Z), S),
	    output(S), retractall(roomAlloted/3), !; write('Can\'t be Scheduled.'), nl, !.

:- initialization(schedule).
