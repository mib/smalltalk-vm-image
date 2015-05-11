parsing
parseKeywordMethodHeader
	| header selectorStream parameters selectorToken parameterToken |
	
	parameters := OrderedCollection new.
	selectorStream := '' writeStream.
	
	[ selectorToken := self peekToken. selectorToken type == #identifier and: [ selectorToken content last == $: ] ]
		whileTrue: [
			selectorStream nextPutAll: self nextToken content.
			parameterToken := self nextToken.
			(parameterToken type ~~ #identifier or: [ parameterToken content last == $: ])
				ifTrue: [ ^ ASParseError signal: 'Missing parameter name.' ].
			parameters add: parameterToken content asSymbol
		].
	
	header := Dictionary new.
	header at: #selector put: selectorStream contents asSymbol.
	header at: #parameters put: parameters.
	
	^ header