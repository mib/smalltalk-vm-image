handling
handles: anExceptionClass
	^ self == anExceptionClass or:
		[ anExceptionClass inheritsFrom: self ]