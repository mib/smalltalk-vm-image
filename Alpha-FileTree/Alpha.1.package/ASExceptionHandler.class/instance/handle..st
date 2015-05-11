handling
handle: anException
	| returnValue |
	
	(self handles: anException class)
		ifFalse: [ ^ false ].
	
	returnValue := handlerBlock cull: anException.
	
	"if the handlerBlock did not perform any action (return, resume, pass), then return to the context that defined this handler"
	anException return: returnValue.
	
	^ true