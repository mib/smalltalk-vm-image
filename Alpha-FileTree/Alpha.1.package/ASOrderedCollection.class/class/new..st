instance creation
new: size
	^ self basicNew
		array: (ASArray new: size);
		initialize