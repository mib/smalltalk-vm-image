parsing
parseMethod
	| method block |
	
	method := ASMethodNode new.
	block := ASBlockNode new.
	
	method header: self parseMethodHeader.
	method primitive: self parsePrimitive.
	block temporaries: self parseTemporaries.
	block statements: self parseStatements.
	block methodRoot: true.
	method block: block.
	
	self peekToken type ~~ #eof
		ifTrue: [
			^ ASParseError signal: 'Expected end of method.'
		].
	
	^ method