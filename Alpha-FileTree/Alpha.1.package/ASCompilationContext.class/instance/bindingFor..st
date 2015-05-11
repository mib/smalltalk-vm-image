accessing
bindingFor: aSymbol
	^ (variables includesKey: aSymbol)
		ifTrue: [ variables at: aSymbol ]
		ifFalse: [
			parentContext ifNotNil: [ parentContext bindingFor: aSymbol ]
		]