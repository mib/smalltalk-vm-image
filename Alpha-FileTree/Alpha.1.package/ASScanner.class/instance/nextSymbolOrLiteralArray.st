scanning
nextSymbolOrLiteralArray
	| token |
	
	"Consume the hash sign."
	stream next.
	
	stream peek == $' ifTrue: [
		token := self nextTokenEnclosedIn: $' ofType: #symbol.
		token content: token content asSymbol.
		^ token
	].
	stream peek == $( ifTrue: [
		stream next.
		^ self createToken: '#(' ofType: #literalArrayStart
	].
	stream peek == $[ ifTrue: [
		stream next.
		^ self createToken: '#[' ofType: #byteArrayStart
	].
	stream peek == ${ ifTrue: [
		stream next.
		^ self nextHeredocString
	].
	
	^ self nextSymbol
	