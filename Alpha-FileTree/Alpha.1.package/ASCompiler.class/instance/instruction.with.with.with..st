instructions
instruction: aSymbol with: firstArgument with: secondArgument with: thirdArgument
	^ instructions add:
		(ASInstruction type: aSymbol with: firstArgument with: secondArgument with: thirdArgument)