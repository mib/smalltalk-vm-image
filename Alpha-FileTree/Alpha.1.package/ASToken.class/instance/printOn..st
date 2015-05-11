printing
printOn: aStream
	aStream nextPut: Character lf.
	aStream nextPut: $(.
	aStream nextPutAll: type.
	aStream nextPutAll: ': '.
	aStream nextPutAll: content printString.
	aStream nextPut: $).