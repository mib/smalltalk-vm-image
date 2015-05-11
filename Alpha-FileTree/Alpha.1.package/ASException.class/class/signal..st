signaling
signal: aString
	^ self new
		signalContext: thisContext sender;
		messageText: aString;
		signal