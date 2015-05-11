visiting inlined messages
visitWhile: aBoolean block: aBlock
	"
	compilation of #whileTrue
		blockBegin:
		evaluate block
		pop and jump to blockBegin if true
	
	compilation of #whileFalse
		blockBegin:
		evaluate block
		pop and jump to blockBegin if false
	"
	| outerCompilationContext blockInstructionStart blockInstructionBytes |
	
	outerCompilationContext := compilationContext.
	compilationContext := ASCompilationContext under: outerCompilationContext.
	
	blockInstructionStart := instructions size + 1.
	
	self visitBlockTemporariesOf: aBlock.
	self visitBlockStatementsOf: aBlock.
	
	blockInstructionBytes := (self instructionByteSizeFrom: blockInstructionStart to: instructions size) negated - 3. "-3 = the jump itself"
		
	self instruction: (aBoolean ifTrue: [ #popJumpIfTrue ] ifFalse: [ #popJumpIfFalse ])
		with: blockInstructionBytes // 256 + 128
		with: blockInstructionBytes \\ 256.
	
	self instruction: #pushNil.
	
	compilationContext := outerCompilationContext