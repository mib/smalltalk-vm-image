parsing
parseExpressionWithPrecedence4
	| token leftExpression |
	
	leftExpression := self parseExpressionWithPrecedence5.
	
	[ token := self peekToken. token type == #identifier and: [ token content last ~~ $: ] ] whileTrue: [
		self nextToken.
		
		leftExpression :=
			ASMessageNode new
				receiver: leftExpression;
				selector: token content asSymbol;
				arguments: (OrderedCollection new).
	].
	
	^ leftExpression