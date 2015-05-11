comparing
= aCollection
	self size ~= aCollection size
		ifTrue: [ ^ false ].
	
	1 to: self size do: [
		:index |
		(self at: index) ~~ (aCollection at: index)
			ifTrue: [ ^ false ]
	].
	
	^ true