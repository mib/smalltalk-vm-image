parsing
parseParenthesisedExpression
	| expression |
	
	self nextToken type ~~ #openingParenthesis ifTrue: [
		^ ASParseError signal: 'Expected opening parenthesis in the expression.'
	].
	
	expression := self parseExpression.
	
	self nextToken type ~~ #closingParenthesis ifTrue: [
		^ ASParseError signal: 'Expected closing parenthesis in the expression.'
	].
	
	^ expression