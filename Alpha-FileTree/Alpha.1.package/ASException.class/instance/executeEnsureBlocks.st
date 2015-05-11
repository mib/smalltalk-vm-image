handling
executeEnsureBlocks
	| currentEnsureContext |
	
	currentEnsureContext := signalContext.
	
	[ currentEnsureContext ~~ handlerContext ]
		whileTrue: [
			currentEnsureContext executeEnsureBlock.
			currentEnsureContext := currentEnsureContext sender.
		]