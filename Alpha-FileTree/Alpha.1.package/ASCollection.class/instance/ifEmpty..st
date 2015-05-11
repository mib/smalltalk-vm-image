testing
ifEmpty: aBlock
	^ self isEmpty
		ifTrue: aBlock
		ifFalse: [ self ]