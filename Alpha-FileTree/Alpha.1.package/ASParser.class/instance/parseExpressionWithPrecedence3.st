parsing
parseExpressionWithPrecedence3
	| token leftExpression |
	
	leftExpression := self parseExpressionWithPrecedence4.
	
	[ self peekToken type == #binaryMessageOrDelimiter ] whileTrue: [
		token := self nextToken.
		
		leftExpression :=
			ASMessageNode new
				receiver: leftExpression;
				selector: token content asSymbol;
				arguments: (OrderedCollection with: self parseExpressionWithPrecedence4).
	].
	
	^ leftExpression