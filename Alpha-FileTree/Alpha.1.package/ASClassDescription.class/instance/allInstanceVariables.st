instance variables
allInstanceVariables
	superclass
		ifNotNil: [
			| superInstVars |
			
			superInstVars := superclass allInstanceVariables.
			
			instanceVariables isEmpty ifTrue: [
				^ superInstVars
			].
			
			^ (OrderedCollection new: superInstVars size + instanceVariables size)
				addAll: superInstVars;
				addAll: instanceVariables;
				yourself
		]
		ifNil: [
			^ (OrderedCollection new: instanceVariables size)
				addAll: instanceVariables;
				yourself
		]