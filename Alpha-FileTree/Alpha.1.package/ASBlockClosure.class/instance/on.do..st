error handling
on: anExceptionClass do: aBlock
	exceptionHandler := ASExceptionHandler on: anExceptionClass do: aBlock.
	^ self value