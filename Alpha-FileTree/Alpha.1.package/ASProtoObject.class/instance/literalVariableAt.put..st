deprecated
literalVariableAt: aSymbol put: anObject
	(self hasClassVariableAt: aSymbol)
		ifTrue: [
			^ self classVariableAt: aSymbol put: anObject
		]
		ifFalse: [
			^ self globalVariableAt: aSymbol put: anObject
		]