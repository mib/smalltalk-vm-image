exception sets
, anExceptionClass
	^ ASExceptionSet new
		add: self;
		add: anExceptionClass;
		yourself