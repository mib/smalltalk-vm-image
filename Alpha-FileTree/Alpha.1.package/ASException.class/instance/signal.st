signaling
signal
	| thisSignalContext |
	thisSignalContext := thisContext sender.
	signalContext ifNil: [ signalContext := thisSignalContext ].
	
	handlerContext := thisContext.
	^ self pass