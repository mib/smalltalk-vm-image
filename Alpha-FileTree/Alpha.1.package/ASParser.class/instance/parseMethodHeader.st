parsing
parseMethodHeader
	| token |
	
	token := self peekToken.
	
	token type == #eof
		ifTrue: [
			^ ASParseError signal: 'Missing method header.'
		].
	
	token type == #binaryMessageOrDelimiter
		ifTrue: [
			^ self parseBinaryMethodHeader
		].
	(token type == #identifier and: [ token content last == $: ])
		ifTrue: [
			^ self parseKeywordMethodHeader
		].
	token type == #identifier
		ifTrue: [
			^ self parseUnaryMethodHeader
		].
	
	^ ASParseError signal: 'Unexpected token encountered while parsing method header.'