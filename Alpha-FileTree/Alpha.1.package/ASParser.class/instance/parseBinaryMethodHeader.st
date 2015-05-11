parsing
parseBinaryMethodHeader
	| header parameterToken |
	
	header := Dictionary new.
	
	header at: #selector put: self nextToken content asSymbol.
	
	parameterToken := self nextToken.
	(parameterToken type ~~ #identifier or: [ parameterToken content last == $: ])
		ifTrue: [ ^ ASParseError signal: 'Missing parameter for binary method.' ].
	header at: #parameters put: (OrderedCollection with: parameterToken content asSymbol ).
	
	^ header