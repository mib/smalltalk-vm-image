instance creation
outerContext: outerContextOrClosure parameterCount: parameterCount temporaryCount: temporaryCount variableOffset: variableOffset stackSize: stackSize
	^ self new
		outerContext: outerContextOrClosure outerContext;
		initialProgramCounter: outerContextOrClosure programCounter + 3;
		parameterCount: parameterCount;
		temporaryCount: temporaryCount;
		variableOffset: variableOffset;
		stackSize: stackSize