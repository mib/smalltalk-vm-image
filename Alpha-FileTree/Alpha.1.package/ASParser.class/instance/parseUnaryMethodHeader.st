parsing
parseUnaryMethodHeader
	| header |
	
	header := Dictionary new.
	
	header at: #selector put: self nextToken content asSymbol.
	header at: #parameters put: OrderedCollection new.
	
	^ header