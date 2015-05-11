visiting inlined messages
visitIf: aReceiver is: aBoolean block: aBlock
	"
	compilation of #ifTrue:
		(evaluate receiver)
		pop and jump to trueBlockEnd if false
		evaluate true block
		jump to falseBlockEnd
		trueBlockEnd:
		push nil
		falseBlockEnd:
	
	compilation of #ifFalse:
		(evaluate receiver)
		pop and jump to falseBlockEnd if true
		evaluate false block
		jump to trueBlockEnd
		falseBlockEnd:
		push nil
		trueBlockEnd:
	"
	| outerCompilationContext blockInstructionStart blockInstructionBytes jumpInstruction |
	
	outerCompilationContext := compilationContext.
	compilationContext := ASCompilationContext under: outerCompilationContext.
	
	jumpInstruction :=
		self instruction: (aBoolean ifTrue: [ #popJumpIfFalse ] ifFalse: [ #popJumpIfTrue ])
			with: 0 with: 0.
	
	blockInstructionStart := instructions size + 1.
	
	self visitBlockTemporariesOf: aBlock.
	self visitBlockStatementsOf: aBlock.
	
	self instruction: #jump
		with: 128
		with: 1.
	
	blockInstructionBytes := (self instructionByteSizeFrom: blockInstructionStart to: instructions size).
	
	jumpInstruction
		first: blockInstructionBytes // 256 + 128;
		second: blockInstructionBytes \\ 256.
	
	self instruction: #pushNil.
	
	compilationContext := outerCompilationContext