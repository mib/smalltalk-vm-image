adding
addFirst: anObject
	firstIndex = 1
		ifTrue: [ self growAtBeginning ].
	
	firstIndex := firstIndex - 1.
	array at: firstIndex put: anObject.
	
	^ anObject