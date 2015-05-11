accessing
peek
	| nextObject |
	
	self atEnd ifTrue: [ ^ nil ].
	
	nextObject := self next.
	position := position - 1.
	^ nextObject