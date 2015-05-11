parsing
parseExpressionWithPrecedence5
	| token |
	
	token := self peekToken.
	
	token type == #eof ifTrue: [
		^ ASParseError signal: 'Expression expected.'
	].
	
	token type == #cascadeReceiver ifTrue: [
		self nextToken.
		^ ASCascadeReceiverNode new
	].
	(self isLiteral: token) ifTrue: [
		^ ASConstantNode new literal: self nextToken content
	].
	(token type == #identifier and: [ token content last ~~ $: ]) ifTrue: [
		^ ASVariableNode new literal: self nextToken content asSymbol
	].
	token type == #openingSquareBracket ifTrue: [
		^ self parseBlock
	].
	token type == #openingBracket ifTrue: [
		^ self parseDynamicArray
	].
	token type == #openingParenthesis ifTrue: [
		^ self parseParenthesisedExpression
	].
	token type == #literalArrayStart ifTrue: [
		^ self parseLiteralArray
	].
	token type == #byteArrayStart ifTrue: [
		^ self parseByteArray
	].
	
	^ ASParseError signal: 'Unexpected ' , token type , ' in the expression.'