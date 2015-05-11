accessing
at: aKey
	| index |
	
	index := self scanFor: aKey.
	
	index
		ifNotNil: [ ^ valueArray at: index ]
		ifNil: [ self error: 'Key not found.' ]
	