visiting inlined messages
visitIf: aReceiver trueBlock: trueBlock falseBlock: falseBlock
	"
	compilation of #ifTrue:ifFalse: and #ifFalse:ifTrue:
		(evaluate receiver)
		pop and jump to trueBlockEnd if false
		evaluate true block
		jump to falseBlockEnd
		trueBlockEnd:
		evaluate false block
		falseBlockEnd:
	"
	| outerCompilationContext trueBlockInstructionStart trueBlockInstructionBytes falseBlockInstructionStart falseBlockInstructionBytes jumpAroundTrueInstruction jumpAroundFalseInstruction |
	
	outerCompilationContext := compilationContext.
	compilationContext := ASCompilationContext under: outerCompilationContext.
	
	jumpAroundTrueInstruction :=
		self instruction: #popJumpIfFalse
			with: 0 with: 0.
	
	trueBlockInstructionStart := instructions size + 1.
	
	self visitBlockTemporariesOf: trueBlock.
	self visitBlockStatementsOf: trueBlock.
	
	jumpAroundFalseInstruction :=
		self instruction: #jump
			with: 0 with: 0.
	
	falseBlockInstructionStart := instructions size + 1.
	
	trueBlockInstructionBytes := (self instructionByteSizeFrom: trueBlockInstructionStart to: instructions size).
	
	jumpAroundTrueInstruction
		first: trueBlockInstructionBytes // 256 + 128;
		second: trueBlockInstructionBytes \\ 256.
	
	compilationContext := ASCompilationContext under: outerCompilationContext.
	
	self visitBlockTemporariesOf: falseBlock.
	self visitBlockStatementsOf: falseBlock.
	
	falseBlockInstructionBytes := (self instructionByteSizeFrom: falseBlockInstructionStart to: instructions size).
	
	jumpAroundFalseInstruction
		first: falseBlockInstructionBytes // 256 + 128;
		second: falseBlockInstructionBytes \\ 256.
	
	compilationContext := outerCompilationContext