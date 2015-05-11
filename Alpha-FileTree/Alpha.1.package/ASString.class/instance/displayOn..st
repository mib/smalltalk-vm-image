printing
displayOn: aStream
	self do: [
		:eachChar |
		aStream nextPut: eachChar
	]