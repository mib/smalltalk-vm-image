adding
addAllLast: aCollection
	aCollection do: [ :each | self addLast: each ].
	
	^ aCollection