instance creation
with: firstObject with: secondObject with: thirdObject with: fourthObject
	^ self new
		add: firstObject;
		add: secondObject;
		add: thirdObject;
		add: fourthObject;
		yourself