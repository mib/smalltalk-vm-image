*Alpha-Pharo
allInstanceVariables
	^ OrderedCollection new
		addAll: thisClass allClassVariables;
		yourself