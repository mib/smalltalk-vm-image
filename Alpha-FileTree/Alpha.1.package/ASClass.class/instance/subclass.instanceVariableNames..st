subclass creation
subclass: nameSymbol instanceVariableNames: instVarArray
	^ self
		subclass: nameSymbol
		instanceVariableNames: instVarArray
		classVariableNames: #()