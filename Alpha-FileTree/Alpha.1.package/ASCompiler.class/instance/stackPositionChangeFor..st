instructions
stackPositionChangeFor: anInstruction
	(anInstruction type beginsWith: #return)
			ifTrue: [ ^ 0 ].
	(anInstruction type beginsWith: #pop)
			ifTrue: [ ^ -1 ].
	(#(duplicateTop)
		includes: anInstruction type)
			ifTrue: [ ^ 1 ].
	(anInstruction type beginsWith: #push)
			ifTrue: [ ^ 1 ].
	(#(createBlockClosure)
		includes: anInstruction type)
			ifTrue: [ ^ 0 ].
	(#(sendSelector sendSelectorToSuper)
		includes: anInstruction type)
			ifTrue: [ ^ (anInstruction second + 1 - 1) negated ]. "pops all arguments and the receiver, pushes the result"
	(#(sendSpecialSelectorWith0Arguments)
		includes: anInstruction type)
			ifTrue: [ ^ 0 ].
	(#(sendSpecialSelectorWith1Argument)
		includes: anInstruction type)
			ifTrue: [ ^ -1 ].
	(#(sendSpecialSelectorWith2Arguments)
		includes: anInstruction type)
			ifTrue: [ ^ -2 ].
	(#(sendSelectorIdentical sendSelectorNotIdentical)
		includes: anInstruction type)
			ifTrue: [ ^ -1 ].
	
	^ 0