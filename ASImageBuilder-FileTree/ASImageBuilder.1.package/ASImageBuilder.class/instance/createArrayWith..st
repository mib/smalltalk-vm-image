helpers
createArrayWith: aCollection
	^ self createEntryWithClass: (self opFor: ASArray) namedPointers: #() indexablePointers: aCollection indexableBytes: #()