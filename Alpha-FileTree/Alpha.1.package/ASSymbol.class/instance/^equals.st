comparing
= aSymbol
	self == aSymbol
		ifTrue: [ ^ true ].
	
	self class == aSymbol class
		ifTrue: [ ^ false ].
	
	^ super = aSymbol