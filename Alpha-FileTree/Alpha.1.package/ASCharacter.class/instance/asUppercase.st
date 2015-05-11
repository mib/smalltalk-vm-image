converting
asUppercase
	(value >= 97 and: [ value <= 122 ])
		ifTrue: [ ^ self - 32 ].
	
	^ self