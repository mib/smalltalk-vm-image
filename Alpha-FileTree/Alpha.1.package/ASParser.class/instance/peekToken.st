parsing
peekToken
	nextToken ifNotNil: [
		^ nextToken
	].
	
	[
		nextToken := scanner nextToken.
		nextToken type == #comment
	] whileTrue.
	
	^ nextToken