visiting
visitConstant: aVariable
	(#(1 0 -1) includes: aVariable literal)
		ifTrue: [
			^ self instruction: (#(#pushSmallIntegerNeg1 #pushSmallInteger0 #pushSmallInteger1) at: aVariable literal + 2)
		].
	
	self instruction: #pushLiteralConstant
		with: (self literal: aVariable literal)