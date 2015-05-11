accessing
skipSeparatorsAndPeekNext
	| next |
	
	[ self atEnd ]
		whileFalse: [
			(next := self next) isSeparator ifFalse: [
				position := position - 1.
				^ next
			]
		].
	
	^ nil