accessing
pointersFor: anObject at: index put: anInteger
	| collection |
	
	collection := IndexablePointers at: anObject ifAbsentPut: [ OrderedCollection new ].
	
	[ collection size < index ] whileTrue: [ collection add: nil ].
	collection at: index put: anInteger.
	
	^ anInteger