compiling
compile
	self initializeCompilationContext.
	instructions := OrderedCollection new.
	literals := IdentityDictionary new.
	
	method accept: self.
	
	self convertToBytecodes.
	
	^ self createCompiledMethod