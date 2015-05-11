scripting
defaultExceptionHandlerContext
	[
		[
			^ thisContext
		]
			on: ASTokenizingError , ASParseError , ASCompileError
			do: [
				:compilationException |
				ASTranscript
					nextPutAll: 'An error has occurred during compilation.';
					cr;
					nextPutAll: compilationException class name.
				
				compilationException messageText
					ifNotNil: [
						ASTranscript
							nextPutAll: ': ';
							nextPutAll: compilationException messageText
					].
				
				ASTranscript cr
			]
	]
		on: ASUnhandledException
		do: [
			:unhandledException |
			ASTranscript
				cr;
				nextPutAll: '*** Unhandled exception ***';
				cr;
				nextPutAll: unhandledException exception class name.
			
			unhandledException exception messageText
				ifNotNil: [
					ASTranscript
						nextPutAll: ': ';
						nextPutAll: unhandledException exception messageText
				].
			
			ASTranscript cr
		]