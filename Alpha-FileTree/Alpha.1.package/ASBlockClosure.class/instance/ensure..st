error handling
ensure: aBlock
	| returnValue |
	
	ensureBlock := aBlock.
	
	returnValue := self value.
	self executeEnsureBlock.
	^ returnValue