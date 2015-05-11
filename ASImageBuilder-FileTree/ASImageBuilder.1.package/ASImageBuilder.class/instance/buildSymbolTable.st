processing
buildSymbolTable
	| symbolClass symbolClassOp allSymbolsCollectionOp |
	
	allSymbolsCollectionOp := self createOrderedCollectionWith: symbols.
	
	symbolClassOp := self opFor: ASSymbol.
	symbolClass := entries detect: [ :entry | (entry at: 2) = symbolClassOp ].
	
	symbolClass at: (HeaderSize + ClassInstanceVariableSize + 1) put: allSymbolsCollectionOp