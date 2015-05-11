instance creation
value: anInteger
	anInteger < 0
		ifTrue: [ self error: 'Value has to be positive.' ].
	
	anInteger > 255
		ifTrue: [ ^ self basicNew setValue: anInteger ].
	
	^ AsciiCharacters at: anInteger + 1