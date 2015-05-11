compiling
createCompiledMethod
	| compiledMethod |
	
	compiledMethod :=
		ASCompiledMethod
			new: literals size
			bytes: bytecodes size.
	
	compiledMethod primitive: primitive.
	compiledMethod parameterCount: parameterCount.
	compiledMethod temporaryCount: temporaryCount - parameterCount.
	compiledMethod stackSize: (self measureStackSizeFor: instructions from: 1 to: instructions size).
	
	literals keysAndValuesDo: [
		:literal :index |
		compiledMethod at: index + 1 put: literal
	].
	bytecodes withIndexDo: [
		:bytecode :index |
		compiledMethod byteAt: index put: bytecode
	].
	
	^ compiledMethod