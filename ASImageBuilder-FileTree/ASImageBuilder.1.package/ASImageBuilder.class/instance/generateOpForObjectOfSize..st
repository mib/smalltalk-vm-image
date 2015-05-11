object pointers
generateOpForObjectOfSize: size
	| op |
	
	op := nextOp.
	nextOp := nextOp + (self convertOpForMemorySpace: size).
	
	^ op