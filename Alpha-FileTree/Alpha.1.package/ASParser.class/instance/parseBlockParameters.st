parsing
parseBlockParameters
	| parameter parameters |
	
	parameters := OrderedCollection new.
	
	self peekToken type ~~ #blockParameter
		ifTrue: [ ^ parameters ].
	
	[ self peekToken type == #blockParameter ]
		whileTrue: [
			parameter := self nextToken content asSymbol.
			(parameters includes: parameter)
				ifTrue: [ ^ ASParseError signal: 'Duplicate block parameter definition: ' , parameter , '.' ].
			parameters add: parameter
		].
	
	self nextToken content ~= #'|'
		ifTrue: [ ^ ASParseError signal: 'Unexpected token encountered while parsing block parameters.' ].
	
	^ parameters