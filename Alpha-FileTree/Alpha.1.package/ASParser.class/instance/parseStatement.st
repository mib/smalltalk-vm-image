parsing
parseStatement
	| token |
	
	token := self peekToken.
	(token type == #eof or: [ token type == #period or: [ token type == #closingSquareBracket or: [ token type == #closingBracket ] ] ])
		ifTrue: [ ^ nil ].
	
	token type == #circumflex
		ifTrue: [ ^ self parseReturnStatement ].
	
	^ self parseExpression