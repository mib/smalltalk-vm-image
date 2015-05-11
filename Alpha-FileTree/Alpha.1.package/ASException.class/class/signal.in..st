signaling
signal: aString in: aContext
	^ self new
		signalContext: aContext;
		messageText: aString;
		signal