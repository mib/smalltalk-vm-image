instance variables
instanceVariableSize
	superclass ifNotNil: [
		^ superclass instanceVariableSize + instanceVariables size
	].
	
	^ instanceVariables size