evaluating
cull: firstArgument
	^ parameterCount < 1
		ifTrue: [ self value ]
		ifFalse: [ self value: firstArgument ]