parsing
parseBlock
	| block |
	
	self nextToken type ~~ #openingSquareBracket ifTrue: [
		^ ASParseError signal: 'Opening square bracket expected.'
	].
	
	block := ASBlockNode new.
	
	block parameters: self parseBlockParameters.
	block temporaries: self parseTemporaries.
	block statements: self parseStatements.
	
	self nextToken type ~~ #closingSquareBracket ifTrue: [
		^ ASParseError signal: 'Closing square bracket expected.'
	].
	
	^ block