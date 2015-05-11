accessing
bytesFor: anObject at: index put: anInteger
	| collection |
	
	collection := IndexableBytes at: anObject ifAbsentPut: [ OrderedCollection new ].
	
	[ collection size < index ] whileTrue: [ collection add: 0 ].
	collection at: index put: anInteger.
	
	^ anInteger