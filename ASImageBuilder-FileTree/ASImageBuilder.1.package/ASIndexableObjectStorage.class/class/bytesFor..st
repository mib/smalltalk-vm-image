accessing
bytesFor: anObject
	^ IndexableBytes at: anObject ifAbsent: [ #() ]