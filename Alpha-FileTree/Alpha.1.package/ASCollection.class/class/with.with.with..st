instance creation
with: firstObject with: secondObject with: thirdObject
	^ self new
		add: firstObject;
		add: secondObject;
		add: thirdObject;
		yourself