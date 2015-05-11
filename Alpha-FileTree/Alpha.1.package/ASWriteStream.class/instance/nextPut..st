accessing
nextPut: anObject
	position >= collection size
		ifTrue: [ self grow ].
	
	position := position + 1.
	collection at: position put: anObject.
	
	position > endPosition
		ifTrue: [ endPosition := position ].
	
	^ anObject