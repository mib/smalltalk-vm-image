parsing
parseExpressionWithPrecedence1
	| token leftExpression |
	
	leftExpression := self parseExpressionWithPrecedence2.
	
	token := self peekToken.
	
	token type == #assignment ifTrue: [
		^ self parseAssignmentTo: leftExpression
	].
	
	^ leftExpression