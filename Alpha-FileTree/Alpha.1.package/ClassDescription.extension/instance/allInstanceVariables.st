*Alpha-Pharo
allInstanceVariables
	| superInstVars |
	
	superclass
		ifNotNil: [
			superInstVars := superclass allInstanceVariables.
			
			(instanceVariables isNil or: [ instanceVariables isEmpty ]) ifTrue: [
				^ superInstVars
			].
			
			^ (OrderedCollection new: superInstVars size + instanceVariables size)
				addAll: superInstVars;
				addAll: instanceVariables;
				yourself
		]
		ifNil: [
			instanceVariables ifNotNil: [
				^ (OrderedCollection new: instanceVariables size)
					addAll: instanceVariables;
					yourself
			].
			^ OrderedCollection new
		]