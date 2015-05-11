parsing
parseAssignmentTo: anExpression
	| token |
	
	(anExpression isVariable and: [ anExpression isImmutable not ])
		ifFalse: [
			^ ASParseError signal: 'Left side of assignment has to be a mutable variable.'
		].
	
	token := self nextToken.
	token type ~~ #assignment
		ifTrue: [
			^ ASParseError signal: 'Expected '':='' in assignment expression.'
		].
	
	^ ASAssignmentNode new
		variable: anExpression;
		expression: self parseExpression