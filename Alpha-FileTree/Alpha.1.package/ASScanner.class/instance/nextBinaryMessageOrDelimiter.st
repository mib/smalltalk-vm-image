scanning
nextBinaryMessageOrDelimiter
	| contentStream |
	
	contentStream := '' writeStream.
	
	[ BinaryMessageCharacters includes: stream peek ]
		whileTrue: [
			contentStream nextPut: stream next
		].
	
	"negative numbers start with a minus sign: - "
	(contentStream contents = '-' and: [ stream peek isDigit ])
		ifTrue: [
			| number |
			number := self nextNumber.
			number content: number content negated.
			^ number
		].
	
	^ self createToken: contentStream contents ofType: #binaryMessageOrDelimiter