instance creation
with: firstObject with: secondObject with: thirdObject with: fourthObject
	^ (self new: 4)
		at: 1 put: firstObject;
		at: 2 put: secondObject;
		at: 3 put: thirdObject;
		at: 4 put: fourthObject;
		yourself