helpers
createSymbolWith: aSymbol
	| op translated characterOpCollection |
	
	translated := aSymbol asSymbol.
	(aSymbol beginsWith: 'AS') ifTrue: [ translated := (aSymbol asString allButFirst: 2) asSymbol ].
	(aSymbol beginsWith: 'XXX') ifTrue: [ translated := (aSymbol asString allButFirst: 3) asSymbol ].
	
	(ops includesKey: translated) ifTrue: [ ^ ops at: translated ].
	(FixedOp includesKey: translated) ifTrue: [ op := FixedOp at: translated ].
	
	characterOpCollection := OrderedCollection new.
	translated do: [ :each | characterOpCollection add: (self processObject: each) ].
	
	op
		ifNotNil: [ self createEntryFor: op class: (self opFor: ASSymbol) namedPointers: #() indexablePointers: characterOpCollection indexableBytes: #() ]
		ifNil: [ op := self createEntryWithClass: (self opFor: ASSymbol) namedPointers: #() indexablePointers: characterOpCollection indexableBytes: #() ].
	
	self storeOp: op for: translated.
	symbols add: op.
	
	^ op