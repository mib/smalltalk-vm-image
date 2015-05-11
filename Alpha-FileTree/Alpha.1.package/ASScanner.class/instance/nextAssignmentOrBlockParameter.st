scanning
nextAssignmentOrBlockParameter
	"Consume the initial colon."
	stream next.
	
	stream peek == $=
		ifTrue: [
			stream next.
			^ self createToken: ':=' ofType: #assignment
		].
	
	^ self nextBlockParameter