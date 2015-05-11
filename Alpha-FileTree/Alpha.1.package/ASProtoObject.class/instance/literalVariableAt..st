deprecated
literalVariableAt: aSymbol
	(self hasClassVariableAt: aSymbol)
		ifTrue: [
			^ self classVariableAt: aSymbol
		]
		ifFalse: [
			^ self globalVariableAt: aSymbol
		]