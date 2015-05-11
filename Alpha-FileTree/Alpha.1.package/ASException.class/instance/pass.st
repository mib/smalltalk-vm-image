handling
pass
	[
		handlerContext := handlerContext sender.
		handlerContext notNil and: [ (handlerContext handle: self) not ]
	] whileTrue.
	
	ASUnhandledException new
		exception: self;
		signalContext: signalContext;
		signal