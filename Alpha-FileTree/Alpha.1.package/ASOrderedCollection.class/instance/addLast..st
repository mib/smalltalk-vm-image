adding
addLast: anObject
	lastIndex = array size
		ifTrue: [ self growAtEnd ].
	
	lastIndex := lastIndex + 1.
	array at: lastIndex put: anObject.
	
	^ anObject