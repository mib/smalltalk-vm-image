printing
printOn: aStream
	aStream nextPut: $#.
	aStream nextPut: $(.
	self printContentsOn: aStream.
	aStream nextPut: $)