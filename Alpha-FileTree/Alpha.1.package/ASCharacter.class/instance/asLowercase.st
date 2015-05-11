converting
asLowercase
	(value >= 65 and: [ value <= 90 ])
		ifTrue: [ ^ self + 32 ].
	
	^ self