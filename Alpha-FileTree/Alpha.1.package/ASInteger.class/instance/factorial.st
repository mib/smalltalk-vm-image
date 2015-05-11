mathematical functions
factorial
	self = 0 ifTrue: [ ^ 1 ].
	self > 0 ifTrue: [ ^ self * (self - 1) factorial ].
	
	self error: 'Factorial is invalid for negative numbers'