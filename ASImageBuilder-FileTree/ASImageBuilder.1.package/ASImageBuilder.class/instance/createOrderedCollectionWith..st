helpers
createOrderedCollectionWith: aCollection
	| arrayOp |
	
	arrayOp := self createArrayWith: aCollection.
	
	^ self createEntryWithClass: (self opFor: ASOrderedCollection) namedPointers: { arrayOp. self smallIntegerOpFor: 1. self smallIntegerOpFor: aCollection size } indexablePointers: #() indexableBytes: #()