error handling
handle: anException
	(closure isNil or:
		[ closure exceptionHandler isNil or:
			[ (closure exceptionHandler handles: anException class) not ] ]) ifTrue: [ ^ false ].
	
	^ closure exceptionHandler handle: anException