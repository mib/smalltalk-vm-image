scanning
nextTokenEnclosedIn: enclosingCharacter ofType: typeSymbol
	| char contentStream |
	
	"Consume the opening enclosing character."
	stream next.
	
	contentStream := '' writeStream.
	
	[
		char := stream next.
	
		char == enclosingCharacter ifTrue: [
			stream peek == enclosingCharacter
				ifTrue: [
					stream next.
				]
				ifFalse: [
					^ self createToken: contentStream contents ofType: typeSymbol.
				]
		].
		
		contentStream nextPut: char.
		
		stream atEnd
	] whileFalse.
	
	ASTokenizingError signal: 'Unexpected EOF.'