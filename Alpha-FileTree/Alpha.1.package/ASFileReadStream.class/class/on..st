instance creation
on: aFilename
	^ self basicNew
		initialize;
		filename: aFilename;
		open