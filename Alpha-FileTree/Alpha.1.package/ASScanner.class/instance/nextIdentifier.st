scanning
nextIdentifier
	| peekChar contentStream |
	
	contentStream := '' writeStream.
	
	peekChar := stream peek.
	
	(peekChar isLetter or: [ peekChar == $_ ])
		ifFalse: [
			ASTokenizingError signal: 'Unexpected character encountered while parsing an identifier. An identifier has to start with a letter or an underscore.'
		].
	
	[ peekChar notNil and: [ peekChar isAlphaNumeric or: [ peekChar == $_ ] ] ]
		whileTrue: [
			contentStream nextPut: stream next.
			peekChar := stream peek
		].
	
	peekChar == $:
		ifTrue: [
			contentStream nextPut: stream next.
		].
	
	^ self createToken: contentStream contents asSymbol ofType: #identifier