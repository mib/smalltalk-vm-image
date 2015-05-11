accessing
pointersFor: anObject
	^ IndexablePointers at: anObject ifAbsent: [ #() ]