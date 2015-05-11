*Alpha-Pharo
allClassVariables
	| superClassVars |
	
	superclass
		ifNotNil: [
			superClassVars := superclass allClassVariables reject: [ :each | each == #DependentsFields or: [ each == #ObsoleteSubclasses ] ].
			
			self classVarNames isEmpty ifTrue: [
				^ superClassVars
			].
			
			^ (OrderedCollection new: superClassVars size + self classVarNames size)
				addAll: superClassVars;
				addAll: self classVarNames;
				yourself
		]
		ifNil: [
			^ (OrderedCollection with: nil with: nil with: nil with: nil with: nil)
				addAll: self classVarNames;
				yourself
		]