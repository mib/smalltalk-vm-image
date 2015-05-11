instructions
cleanUpAfterStatement
	(self isPopOrReturnInstruction: instructions last)
		ifFalse: [
			self instruction: #pop
		]