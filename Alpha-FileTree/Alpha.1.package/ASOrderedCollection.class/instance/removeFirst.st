removing
removeFirst
	self isEmpty ifTrue: [ ^ self error: 'Collection is empty.' ].
	
	firstIndex := firstIndex + 1