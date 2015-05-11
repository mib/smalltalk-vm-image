printing
printOn: aStream
	aStream nextPutAll: 'a '.
	aStream nextPutAll: self class name.