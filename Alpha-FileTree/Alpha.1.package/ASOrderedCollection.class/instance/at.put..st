accessing
at: index put: anObject
	lastIndex := lastIndex max: index.
	
	^ array at: index + firstIndex - 1 put: anObject