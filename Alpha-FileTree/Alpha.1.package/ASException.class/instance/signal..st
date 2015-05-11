signaling
signal: aString
	| thisSignalContext |
	thisSignalContext := thisContext sender.
	signalContext ifNil: [ signalContext := thisSignalContext ].
	
	messageText := aString.
	^ self signal