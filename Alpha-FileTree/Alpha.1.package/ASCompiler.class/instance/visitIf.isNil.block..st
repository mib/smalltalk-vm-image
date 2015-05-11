visiting inlined messages
visitIf: aReceiver isNil: aBoolean block: aBlock
	"
	compilation of #ifNil:
		(evaluate receiver)
		duplicate top
		pop and jump to nilBlockEnd if not nil
		pop
		evaluate nil block
		nilBlockEnd:
	
	compilation of #ifNotNil:
		(evaluate receiver)
		duplicate top
		pop and jump to notNilBlockEnd if nil
		pop
		evaluate not nil block
		notNilBlockEnd:
	"
	| outerCompilationContext blockInstructionStart blockInstructionBytes jumpInstruction |
	
	self instruction: #duplicateTop.
	
	outerCompilationContext := compilationContext.
	compilationContext := ASCompilationContext under: outerCompilationContext.
	
	jumpInstruction :=
		self instruction: (aBoolean ifTrue: [ #popJumpIfNotNil ] ifFalse: [ #popJumpIfNil ])
			with: 0 with: 0.
	
	blockInstructionStart := instructions size + 1.
	
	self instruction: #pop.
	
	self visitBlockTemporariesOf: aBlock.
	self visitBlockStatementsOf: aBlock.
	
	blockInstructionBytes := (self instructionByteSizeFrom: blockInstructionStart to: instructions size).
	
	jumpInstruction
		first: blockInstructionBytes // 256 + 128;
		second: blockInstructionBytes \\ 256.
	
	compilationContext := outerCompilationContext