instance creation
new: size
	^ self basicNew
		keyArray: (ASArray new: size);
		valueArray: (ASArray new: size);
		initialize