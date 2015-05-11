parsing
parsePrimitive
	| token primitiveNumber |
	
	self peekToken content ~= #'<'
		ifTrue: [ ^ nil ].
	
	self nextToken.
	
	token := self nextToken.
	(token type ~~ #identifier or: [ token content ~= 'primitive:' ])
		ifTrue: [ ^ ASParseError signal: 'Unexpected token encountered while parsing method primitive.' ].
	
	token := self nextToken.
	(token type ~~ #number or: [ (token content asInteger between: 0 and: 255) not ])
		ifTrue: [ ^ ASParseError signal: 'Unexpected token encountered while parsing method primitive.' ].
	
	primitiveNumber := token content asInteger.
	
	self nextToken content ~= #'>'
		ifTrue: [ ^ ASParseError signal: 'Unexpected token encountered while parsing method primitive.' ].
	
	^ primitiveNumber