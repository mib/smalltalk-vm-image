scanning
nextCharacter
	"Consume the initial dollar sign."
	stream next.
	
	^ self createToken: stream next ofType: #character