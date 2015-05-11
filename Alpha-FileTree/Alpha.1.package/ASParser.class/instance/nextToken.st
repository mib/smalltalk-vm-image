parsing
nextToken
	| token |
	
	nextToken ifNotNil: [
		token := nextToken.
		nextToken := nil.
		^ token
	].
	
	[
		token := scanner nextToken.
		token type == #comment
	] whileTrue.
	
	^ token