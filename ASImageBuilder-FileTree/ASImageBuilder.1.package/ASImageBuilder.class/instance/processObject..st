processing
processObject: object
	| op instVars class indexablePointers indexableBytes |
	
	(object isKindOf: SmallInteger) ifTrue: [ ^ self smallIntegerOpFor: object ].
	
	(FixedOp includesKey: object) ifTrue: [ ^ FixedOp at: object ].
	(ops includesKey: object) ifTrue: [ ^ ops at: object ].
	
	(object isKindOf: Character) ifTrue: [ ^ self characterOpFor: object asciiValue ].
	(object isKindOf: ASCharacter) ifTrue: [ ^ self characterOpFor: object asciiValue ].
	(object isKindOf: Symbol) ifTrue: [ ^ self createSymbolWith: object ].
	(object isKindOf: ASSymbol) ifTrue: [ ^ self createSymbolWith: object ].
	(object isKindOf: String) ifTrue: [ ^ self createStringWith: object ].
	(object isKindOf: ASString) ifTrue: [ ^ self createStringWith: object ].
	(object isKindOf: Dictionary) ifTrue: [ ^ self createDictionaryWith: (object associations collect: [ :each | (self processObject: each key) -> (self processObject: each value) ]) asDictionary ].
	(object isKindOf: ASDictionary) ifTrue: [ ^ self createDictionaryWith: (object associations collect: [ :each | (self processObject: each key) -> (self processObject: each value) ]) asDictionary ].
	(object isKindOf: ArrayedCollection) ifTrue: [ ^ self createArrayWith: (object collect: [ :each | self processObject: each ]) ].
	(object isKindOf: ASArrayedCollection) ifTrue: [ ^ self createArrayWith: (object collect: [ :each | self processObject: each ]) ].
	(object isKindOf: OrderedCollection) ifTrue: [ ^ self createOrderedCollectionWith: (object collect: [ :each | self processObject: each ]) ].
	(object isKindOf: ASOrderedCollection) ifTrue: [ ^ self createOrderedCollectionWith: (object collect: [ :each | self processObject: each ]) ].
	
	processedObjects at: object ifPresent: [ ^ ASFuturePointer to: object ] ifAbsent: [ processedObjects at: object put: true ].
	
	instVars := OrderedCollection new.
	
	class := object class.
	
	class allInstanceVariables do: [
		:instVarName |
		instVars add: (self processObject: (object instVarNamed: instVarName))
	].
	
	indexablePointers := OrderedCollection new.
	(ASIndexableObjectStorage pointersFor: object) do: [
		:indexablePointer |
		indexablePointers add: (self processObject: indexablePointer)
	].
	
	indexableBytes := ASIndexableObjectStorage bytesFor: object.
	
	op := self createEntryWithClass: (self opFor: class) namedPointers: instVars indexablePointers: indexablePointers indexableBytes: indexableBytes.
	
	self storeOp: op for: object.
	
	processedObjects removeKey: object.
	
	^ op