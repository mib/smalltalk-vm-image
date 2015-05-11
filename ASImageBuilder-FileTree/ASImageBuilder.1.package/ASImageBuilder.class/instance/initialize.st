initialization
initialize
	super initialize.
	
	ops := IdentityDictionary new.
	processedObjects := IdentityDictionary new.
	entries := OrderedCollection new.
	symbols := OrderedCollection new.
	classes := IdentityDictionary new.
	
	nextOp := self convertOpForMemorySpace: FirstFreeOp