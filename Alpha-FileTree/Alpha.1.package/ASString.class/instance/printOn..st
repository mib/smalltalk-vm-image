printing
printOn: aStream
	aStream nextPut: $'.
	self do: [
		:eachChar |
		aStream nextPut: eachChar
	].
	aStream nextPut: $'