parsing
parseLiteralArrayItem
	| token |
	
	token := self peekToken.
	
	(self isLiteral: token) ifTrue: [
		self nextToken.
		^ ASConstantNode new literal: token content
	].
	token type == #identifier ifTrue: [
		self nextToken.
		(#(#true #false #nil) includes: token content asSymbol)
			ifTrue: [
				^ ASSpecialVariableNode new literal: token content asSymbol
			].
		^ ASConstantNode new literal: token content asSymbol
	].
	token type == #openingParenthesis ifTrue: [
		^ self parseLiteralArray
	].
	
	^ ASParseError signal: 'Unexpected token encountered while parsing a literal array.'