compiling
compile: aMethod forClass: aClass
	self initialize.
	
	^ (self new
		method: aMethod;
		classContext: aClass;
		compile)
			class: aClass