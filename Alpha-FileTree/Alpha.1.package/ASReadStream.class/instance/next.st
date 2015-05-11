accessing
next
	^ position >= endPosition
		ifTrue: [ nil ]
		ifFalse: [ collection at: (position := position + 1) ]