instance creation
with: firstObject with: secondObject with: thirdObject
	^ (self new: 3)
		at: 1 put: firstObject;
		at: 2 put: secondObject;
		at: 3 put: thirdObject;
		yourself