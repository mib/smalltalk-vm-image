parsing
parseExpressionWithPrecedence2
	| token leftExpression selectorStream arguments |
	
	leftExpression := self parseExpressionWithPrecedence3.
	
	token := self peekToken.
	(token type == #identifier and: [ token content last == $: ])
		ifFalse: [ ^ self parseCascadeFor: leftExpression ].
	
	selectorStream := '' writeStream.
	arguments := OrderedCollection new.
	
	[ token := self peekToken. token type == #identifier and: [ token content last == $: ] ] whileTrue: [
		self nextToken.
		
		selectorStream nextPutAll: token content.
		arguments add: self parseExpressionWithPrecedence3
	].
	
	leftExpression :=
		ASMessageNode new
			receiver: leftExpression;
			selector: selectorStream contents asSymbol;
			arguments: arguments.
	
	^ self parseCascadeFor: leftExpression