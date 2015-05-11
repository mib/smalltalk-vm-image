instructions
isPopOrReturnInstruction: anInstruction
	^ (anInstruction type beginsWith: #pop) or: [ anInstruction type beginsWith: #return ]