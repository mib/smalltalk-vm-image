enumerating
noneSatisfy: aBlock
	self do: [ :each | (aBlock value: each) ifTrue: [ ^ false ] ].
	^ true