processing
processSpecialObjects
	self createEntryFor: (self opFor: nil) class: (self opFor: ASUndefinedObject) namedPointers: #() indexablePointers: #() indexableBytes: #().
	self createEntryFor: (self opFor: true) class: (self opFor: ASTrue) namedPointers: #() indexablePointers: #() indexableBytes: #().
	self createEntryFor: (self opFor: false) class: (self opFor: ASFalse) namedPointers: #() indexablePointers: #() indexableBytes: #().
	
	(FixedOp associations select: [
		:assoc | assoc key isSymbol
	]) do: [ :each | self createSymbolWith: each key ]