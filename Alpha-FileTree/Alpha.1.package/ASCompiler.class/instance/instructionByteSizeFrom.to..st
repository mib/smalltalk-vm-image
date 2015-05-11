instructions
instructionByteSizeFrom: fromIndex to: toIndex
	| bytes |
	
	bytes := 0.
	fromIndex to: toIndex do: [
		:index |
		bytes := bytes + (instructions at: index) bytes
	].
	^ bytes