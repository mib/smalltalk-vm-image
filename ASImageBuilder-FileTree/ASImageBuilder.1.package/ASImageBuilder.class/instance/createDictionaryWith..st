helpers
createDictionaryWith: aDictionary
	| keyCollection keyArrayOp valueCollection valueArrayOp |
	
	keyCollection := OrderedCollection new.
	valueCollection := OrderedCollection new.
	
	aDictionary keysAndValuesDo: [
		:key :value |
		keyCollection add: key.
		valueCollection add: value
	].
	
	keyArrayOp := self createArrayWith: keyCollection.
	valueArrayOp := self createArrayWith: valueCollection.
	
	^ self createEntryWithClass: (self opFor: ASDictionary) namedPointers: { keyArrayOp. valueArrayOp } indexablePointers: #() indexableBytes: #()