handling
handles: anExceptionClass
	^ exceptionClasses anySatisfy: [ :exceptionClass | exceptionClass handles: anExceptionClass ]