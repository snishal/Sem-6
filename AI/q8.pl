/*
	Predicate toh(Source, Destination, Helper, Number of Disks)
				Moves N Disks from Source to Destination using Helper
				Breaks into N-1 Disk from Source to Helper using Destination
							1 disk from Source to Destination (Print the step)
							N-1 Disk from Helper to Destination using Source
				Stores Result in Param3

	Base Case: toh(S,D,H,0) : No steps to be done to move 0 number of disks
*/
toh(S,D,H,0).
toh(S,D,H,N) :-
	N > 0, 
	N1 is N-1,
	toh(S,H,D,N1), 
	write(S), 
	write(' -> '),
	write(D), 
	nl,
	toh(H,D,S,N1). 

go :- 
	write('Enter Number of Disks : '),
	read(X),
	toh('a','b','c',X);write('Enter Valid Number of Disks'),!.

:-initialization(go).
