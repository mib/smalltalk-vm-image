accessing
at: aKey put: aValue
	| index |
	
	index := self scanFor: aKey.
	
	index ifNil: [
		index := self scanForEmptySlot.
		index ifNil: [
			self grow.
			index := self scanForEmptySlot
		]
	].
	
	keyArray at: index put: aKey.
	^ valueArray at: index put: aValue