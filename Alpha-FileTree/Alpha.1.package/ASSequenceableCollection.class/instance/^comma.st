copying
, aCollection
	| newCollection mySize |
	
	mySize := self size.
	newCollection := self class new: mySize + aCollection size.
	
	1 to: mySize do: [
		:index |
		newCollection at: index put: (self at: index)
	].
	1 to: aCollection size do: [
		:index |
		newCollection at: index + mySize put: (aCollection at: index)
	].
	
	^ newCollection