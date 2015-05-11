instance creation
newFrom: aCollection
	^ (self new: aCollection size)
		addAll: aCollection;
		yourself