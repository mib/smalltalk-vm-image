scanning
nextSymbol
	| peekChar contentStream |
	
	contentStream := '' writeStream.
	
	peekChar := stream peek.
	
	"(peekChar isLetter or: [ peekChar == $: ])
		ifFalse: [
			ASTokenizingError signal: 'Unexpected character encountered while parsing a symbol. A symbol has to start with a letter or a colon.'
		]."
	
	[ peekChar notNil and: [ peekChar isAlphaNumeric or: [ (#($: $_) includes: peekChar) or: [ BinaryMessageCharacters includes: peekChar ] ] ] ]
		whileTrue: [
			contentStream nextPut: stream next.
			peekChar := stream peek
		].
	
	^ self createToken: contentStream contents asSymbol ofType: #symbol