visiting inlined messages
visitWhile: conditionBlock is: aBoolean block: bodyBlock
	"
	compilation of #whileTrue:
		condition:
		evaluate condition block
		pop and jump to #end if false
		evaluate body block
		pop
		jump to condition
		end:
		push nil
	
	compilation of #whileFalse:
		condition:
		evaluate condition block
		pop and jump to #end if true
		evaluate body block
		pop
		jump to condition
		end:
		push nil
	"
	| outerCompilationContext conditionBlockInstructionStart conditionBlockInstructionBytes bodyBlockInstructionStart bodyBlockInstructionBytes jumpAroundBodyInstruction |
	
	outerCompilationContext := compilationContext.
	compilationContext := ASCompilationContext under: outerCompilationContext.
	
	conditionBlockInstructionStart := instructions size + 1.
	
	self visitBlockTemporariesOf: conditionBlock.
	self visitBlockStatementsOf: conditionBlock.
	
	jumpAroundBodyInstruction :=
		self instruction: (aBoolean ifTrue: [ #popJumpIfFalse ] ifFalse: [ #popJumpIfTrue ])
			with: 0 with: 0.
	
	bodyBlockInstructionStart := instructions size + 1.
	
	compilationContext := ASCompilationContext under: outerCompilationContext.
	
	self visitBlockTemporariesOf: bodyBlock.
	self visitBlockStatementsOf: bodyBlock.
	
	self instruction: #pop.
	
	conditionBlockInstructionBytes := ((self instructionByteSizeFrom: conditionBlockInstructionStart to: instructions size) + 3) negated.
	
	self instruction: #jump
		with: conditionBlockInstructionBytes // 256 + 128
		with: conditionBlockInstructionBytes \\ 256.
	
	bodyBlockInstructionBytes := (self instructionByteSizeFrom: bodyBlockInstructionStart to: instructions size).
	
	jumpAroundBodyInstruction
		first: bodyBlockInstructionBytes // 256 + 128;
		second: bodyBlockInstructionBytes \\ 256.
	
	compilationContext := outerCompilationContext.
	
	self instruction: #pushNil