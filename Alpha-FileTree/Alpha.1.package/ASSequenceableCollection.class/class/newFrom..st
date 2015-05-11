instance creation
newFrom: aCollection
	| newCollection |
	
	newCollection := self new: aCollection size.
	
	1 to: aCollection size do: [
		:index |
		newCollection at: index put: (aCollection at: index)
	].
	
	^ newCollection