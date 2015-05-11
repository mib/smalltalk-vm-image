removing
removeLast
	self isEmpty ifTrue: [ ^ self error: 'Collection is empty.' ].
	
	lastIndex := lastIndex - 1