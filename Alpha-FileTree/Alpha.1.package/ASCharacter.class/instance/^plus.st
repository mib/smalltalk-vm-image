arithmetic
+ aMagnitude
	aMagnitude isCharacter ifTrue: [
		^ value + aMagnitude asciiValue
	].
	aMagnitude isNumber ifTrue: [
		^ self class value: value + aMagnitude
	].
	
	ASInvalidArgument signal: 'The argument has to be either a character or a number.'