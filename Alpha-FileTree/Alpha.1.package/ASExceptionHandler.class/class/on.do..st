instance creation
on: anExceptionClass do: aBlock
	^ self new
		exceptionClass: anExceptionClass;
		handlerBlock: aBlock