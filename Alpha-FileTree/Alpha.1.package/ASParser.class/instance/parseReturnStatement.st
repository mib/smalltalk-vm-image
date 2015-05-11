parsing
parseReturnStatement
	self nextToken type ~~ #circumflex
		ifTrue: [ ^ ASParseError signal: 'Unexpected token encountered while parsing a return statement.' ].
	
	^ ASReturnNode new expression: self parseExpression