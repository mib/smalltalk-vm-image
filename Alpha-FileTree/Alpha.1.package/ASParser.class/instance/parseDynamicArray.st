parsing
parseDynamicArray
	| statements |
	
	self nextToken type ~~ #openingBracket ifTrue: [
		^ ASParseError signal: 'Opening bracket expected.'
	].
	
	statements := self parseStatements.
	
	self nextToken type ~~ #closingBracket ifTrue: [
		^ ASParseError signal: 'Closing bracket expected.'
	].
	
	^ self makeArrayWith: statements