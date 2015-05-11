parsing
parseCascadeFor: aMessage
	| receiver messages |
	
	self peekToken type ~~ #semicolon
		ifTrue: [ ^ aMessage ].
	
	aMessage isMessage ifFalse: [
		^ ASParseError signal: 'The first element in a cascade is not a message.'
	].
	
	"if there are three or more messages in a cascade, then let the outer cascade contain all messages, do not recursively start another cascade"
	aMessage receiver isCascadeReceiver
		ifTrue: [ ^ aMessage ].
	
	receiver := aMessage receiver.
	aMessage receiver: ASCascadeReceiverNode new.
	messages := OrderedCollection with: aMessage.
	
	[ self peekToken type == #semicolon ] whileTrue: [
		"Make a special node as the placeholder-receiver of subsequent messages."
		nextToken :=
			ASToken new
				content: nil;
				type: #cascadeReceiver.
		
		messages add: self parseExpressionWithPrecedence2.
	].
	
	^ ASCascadeNode new
		receiver: receiver;
		messages: messages