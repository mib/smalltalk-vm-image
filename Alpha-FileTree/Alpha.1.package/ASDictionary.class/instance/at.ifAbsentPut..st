accessing
at: aKey ifAbsentPut: aValue
	| index |
	
	index := self scanFor: aKey.
	
	index ifNotNil: [
		^ valueArray at: index
	].
	
	^ self at: aKey put: aValue