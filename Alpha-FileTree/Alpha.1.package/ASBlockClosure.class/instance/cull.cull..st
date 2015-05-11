evaluating
cull: firstArgument cull: secondArgument
	^ parameterCount < 2
		ifTrue: [ self cull: firstArgument ]
		ifFalse: [ self value: firstArgument value: secondArgument ]