visiting inlined messages
visitIf: aReceiver nilBlock: nilBlock notNilBlock: notNilBlock
	"
	compilation of #ifNil:ifNotNil: and #ifNotNil:ifNil:
		(evaluate receiver)
		pop and jump to nilBlockEnd if not nil
		evaluate nil block
		jump to notNilBlockEnd
		nilBlockEnd:
		evaluate not nil block
		notNilBlockEnd:
	"
	| outerCompilationContext nilBlockInstructionStart nilBlockInstructionBytes notNilBlockInstructionStart notNilBlockInstructionBytes jumpAroundNilInstruction jumpAroundNotNilInstruction |
	
	outerCompilationContext := compilationContext.
	compilationContext := ASCompilationContext under: outerCompilationContext.
	
	jumpAroundNilInstruction :=
		self instruction: #popJumpIfNotNil
			with: 0 with: 0.
	
	nilBlockInstructionStart := instructions size + 1.
	
	self visitBlockTemporariesOf: nilBlock.
	self visitBlockStatementsOf: nilBlock.
	
	jumpAroundNotNilInstruction :=
		self instruction: #jump
			with: 0 with: 0.
	
	notNilBlockInstructionStart := instructions size + 1.
	
	nilBlockInstructionBytes := (self instructionByteSizeFrom: nilBlockInstructionStart to: instructions size).
	
	jumpAroundNilInstruction
		first: nilBlockInstructionBytes // 256 + 128;
		second: nilBlockInstructionBytes \\ 256.
	
	compilationContext := ASCompilationContext under: outerCompilationContext.
	
	self visitBlockTemporariesOf: notNilBlock.
	self visitBlockStatementsOf: notNilBlock.
	
	notNilBlockInstructionBytes := (self instructionByteSizeFrom: notNilBlockInstructionStart to: instructions size).
	
	jumpAroundNotNilInstruction
		first: notNilBlockInstructionBytes // 256 + 128;
		second: notNilBlockInstructionBytes \\ 256.
	
	compilationContext := outerCompilationContext