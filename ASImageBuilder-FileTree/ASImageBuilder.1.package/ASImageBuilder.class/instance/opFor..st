object pointers
opFor: anObject
	(FixedOp includesKey: anObject)
		ifTrue: [ ^ FixedOp at: anObject ].
	
	(ops includesKey: anObject)
		ifTrue: [ ^ ops at: anObject ].
	
	"This is only reached for classes that do not have fixed pointers. Their object size is HeaderSize + ClassInstanceVariableSize + class variables they have."
	^ ops at: anObject put: (self generateOpForObjectOfSize: HeaderSize + ClassInstanceVariableSize + (anObject class == Metaclass ifTrue: [ 0 ] ifFalse: [ anObject classVarNames size ]))