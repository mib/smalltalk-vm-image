parsing
parseLiteralArray
	| items |
	
	self nextToken type ~~ #literalArrayStart ifTrue: [
		^ ASParseError signal: 'Literal array start expected.'
	].
	
	items := OrderedCollection new.
		
	[ self peekToken type ~~ #closingParenthesis ]
		whileTrue: [
			items add: self parseLiteralArrayItem
		].
	
	self nextToken type ~~ #closingParenthesis ifTrue: [
		^ ASParseError signal: 'Closing parenthesis expected.'
	].
	
	^ self makeArrayWith: items