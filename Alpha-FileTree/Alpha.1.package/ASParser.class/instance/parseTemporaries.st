parsing
parseTemporaries
	| token temporary temporaries |
	
	temporaries := OrderedCollection new.
	
	token := self peekToken.
	(token content = #'||' or: [ token content ~= #'|' ])
		ifTrue: [ ^ temporaries ].
	
	self nextToken.
	
	[ token := self peekToken. token type == #identifier and: [ token content last ~~ $: ] ]
		whileTrue: [
			self nextToken.
			temporary := token content asSymbol.
			(temporaries includes: temporary)
				ifTrue: [ ^ ASParseError signal: 'Duplicate temporary variable definition: ' , temporary , '.' ].
			temporaries add: temporary
		].
	
	self nextToken content ~= #'|'
		ifTrue: [ ^ ASParseError signal: 'Unexpected token encountered while parsing temporaries.' ].
	
	^ temporaries