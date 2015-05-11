printing
printOn: aStream
	type printOn: aStream.
	aStream nextPut: $(.
	first ifNotNil: [
		first printOn: aStream.
	].
	second ifNotNil: [
		aStream nextPut: $ .
		second printOn: aStream.
	].
	third ifNotNil: [
		aStream nextPut: $ .
		third printOn: aStream.
	].
	aStream nextPut: $)