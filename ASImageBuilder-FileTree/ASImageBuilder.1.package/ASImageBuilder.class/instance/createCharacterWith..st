helpers
createCharacterWith: asciiValue
	^ self createEntryFor: (self characterOpFor: asciiValue) class: (self opFor: ASCharacter) namedPointers: { self processObject: asciiValue } indexablePointers: #() indexableBytes: #()