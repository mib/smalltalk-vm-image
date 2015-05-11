scanning
nextToken
	| char |
	
	char := stream skipSeparatorsAndPeekNext.
	
	"Keep returning a special token #eof at the end of the stream to avoid nil checks in the parser."
	stream atEnd ifTrue: [ ^ self createToken: nil ofType: #eof ].
	
	(CharacterTokens includesKey: char)
		ifTrue: [
			^ self createToken: stream next ofType: (CharacterTokens at: char)
		].
	(BinaryMessageCharacters includes: char)
		ifTrue: [
			^ self nextBinaryMessageOrDelimiter
		].
	
	char == $$ ifTrue: [
		^ self nextCharacter
	].
	char == $" ifTrue: [
		^ self nextComment
	].
	char == $' ifTrue: [
		^ self nextString
	].
	char == $# ifTrue: [
		^ self nextSymbolOrLiteralArray
	].
	char == $: ifTrue: [
		^ self nextAssignmentOrBlockParameter
	].
	char isDigit ifTrue: [
		^ self nextNumber
	].
	(char isLetter or: [ char == $_ ]) ifTrue: [
		^ self nextIdentifier
	].
	
	^ ASTokenizingError signal: 'Unexpected "' , char , '" encountered while parsing the input.'