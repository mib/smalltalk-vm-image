object pointers
storeOp: op for: anObject
	ops at: anObject put: op.
	
	^ op