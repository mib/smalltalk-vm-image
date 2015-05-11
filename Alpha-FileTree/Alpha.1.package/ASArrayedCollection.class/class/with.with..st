instance creation
with: firstObject with: secondObject
	^ (self new: 2)
		at: 1 put: firstObject;
		at: 2 put: secondObject;
		yourself