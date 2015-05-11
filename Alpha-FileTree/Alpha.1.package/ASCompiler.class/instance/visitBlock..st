visiting
visitBlock: aBlock
	| outerCompilationContext blockInstructionStart blockInstructionBytes stackSizeInstruction jumpAroundInstruction |
	
	aBlock methodRoot ifFalse: [
		outerCompilationContext := compilationContext.
		compilationContext := ASCompilationContext under: outerCompilationContext.
		
		"(ASGlobalVariableNode new literal: #ASBlockClosure) accept: self.
		self instruction: #pushThisContext.
		self instruction: #pushLiteralConstant
			with: (self literal: aBlock parameters size).
		self instruction: #pushLiteralConstant
			with: (self literal: aBlock temporaries size).
		self instruction: #pushLiteralConstant
			with: (self literal: temporaryCount).
		stackSizeInstruction :=
			self instruction: #pushLiteralConstant
				with: 0.
		self instruction: #sendSelector
			with: (self literal: #outerContext:parameterCount:temporaryCount:variableOffset:stackSize:)
			with: 5."
		
		stackSizeInstruction :=
			self instruction: #pushLiteralConstant
				with: 0.
		self instruction: #createBlockClosure
			with: aBlock parameters size
			with: aBlock temporaries size
			with: temporaryCount.
		
		jumpAroundInstruction :=
			self instruction: #jump
				with: 0.
		
		blockInstructionStart := instructions size + 1.
		
		self visitBlockParametersOf: aBlock
	].
	
	self visitBlockTemporariesOf: aBlock.
	self visitBlockStatementsOf: aBlock.
	self visitBlockReturnOf: aBlock.
	
	aBlock methodRoot ifFalse: [
		blockInstructionBytes := self instructionByteSizeFrom: blockInstructionStart to: instructions size.
		
		jumpAroundInstruction
			first: blockInstructionBytes // 256 + 128;
			second: blockInstructionBytes \\ 256.
		
		stackSizeInstruction first: (self literal: (self measureStackSizeFor: instructions from: blockInstructionStart to: instructions size)).
		
		compilationContext := outerCompilationContext
	]