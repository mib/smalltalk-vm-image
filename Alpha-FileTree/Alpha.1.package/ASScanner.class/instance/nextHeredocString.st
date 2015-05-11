scanning
nextHeredocString
	"Parse a heredoc-string (non-standard syntax):
		#{ a string
			with multiple lines
			that ends with a closing bracket at the beginning of a line
}
	"
	| contentStream char lastCharacter |
	
	contentStream := '' writeStream.
	lastCharacter := ${.
	
	[ stream atEnd ]
		whileFalse: [
			char := stream next.
			
			"closing bracket at the beginning of a line"
			(char == $} and: [ #(10 13) includes: lastCharacter asciiValue ])
				ifTrue: [
					^ self createToken: contentStream contents ofType: #string
				].
			
			contentStream nextPut: char.
			lastCharacter := char
		].
	
	^ ASTokenizingError signal: 'Unexpected EOF while parsing a heredoc string.'