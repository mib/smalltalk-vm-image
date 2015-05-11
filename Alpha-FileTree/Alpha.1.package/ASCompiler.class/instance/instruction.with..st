instructions
instruction: aSymbol with: firstArgument
	^ instructions add:
		(ASInstruction type: aSymbol with: firstArgument)