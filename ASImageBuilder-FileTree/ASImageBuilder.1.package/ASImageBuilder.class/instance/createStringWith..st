helpers
createStringWith: aString
	| characterOpCollection |
	characterOpCollection := OrderedCollection new.
	aString do: [ :each | characterOpCollection add: (self processObject: each) ].
	
	^ self createEntryWithClass: (self opFor: ASString) namedPointers: #() indexablePointers: characterOpCollection indexableBytes: #()