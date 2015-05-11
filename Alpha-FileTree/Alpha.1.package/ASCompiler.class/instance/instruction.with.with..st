instructions
instruction: aSymbol with: firstArgument with: secondArgument
	^ instructions add:
		(ASInstruction type: aSymbol with: firstArgument with: secondArgument)