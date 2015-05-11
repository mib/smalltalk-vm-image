accessing
at: aKey ifAbsent: aBlock
	| index |
	
	index := self scanFor: aKey.
	
	index ifNotNil: [
		^ valueArray at: index
	].
	
	^ aBlock value