scanning
nextNumber
	| value |
	
	value := 0.
	
	[ DecimalNumberCharacters includesKey: stream peek ]
		whileTrue: [
			value := value * 10 + (stream next asciiValue - $0 asciiValue)
		].
	
	^ self createToken: value ofType: #number