helpers
createEntryFor: op class: classOp namedPointers: namedPointers indexablePointers: indexablePointers indexableBytes: indexableBytes
	| entry objectSize |
	
	objectSize := HeaderSize + namedPointers size + indexablePointers size + (indexableBytes size + 3 // 4).
	
	op ifNil: [ op := self generateOpForObjectOfSize: objectSize ].
	
	entry := OrderedCollection new.
	entry add: objectSize.
	entry add: op.
	entry add: -1. "the object is not remembered"
	entry add: classOp.
	entry add: HeaderSize.
	entry add: namedPointers size.
	entry add: HeaderSize + namedPointers size.
	entry add: indexablePointers size.
	entry add: HeaderSize + namedPointers size + indexablePointers size.
	entry add: indexableBytes size.
	
	entry addAll: namedPointers.
	entry addAll: indexablePointers.
	
	1 to: indexableBytes size + 3 // 4 do: [
		:four |
		entry add: (
			OrderedCollection
				with: (four * 4 - 3 <= indexableBytes size ifTrue: [ indexableBytes at: four * 4 - 3 ] ifFalse: [ 0 ])
				with: (four * 4 - 2 <= indexableBytes size ifTrue: [ indexableBytes at: four * 4 - 2 ] ifFalse: [ 0 ])
				with: (four * 4 - 1 <= indexableBytes size ifTrue: [ indexableBytes at: four * 4 - 1 ] ifFalse: [ 0 ])
				with: (four * 4 <= indexableBytes size ifTrue: [ indexableBytes at: four * 4 ] ifFalse: [ 0 ])
		)
	].
	
	entries add: entry.
	
	^ op