copying
reversed
	| reversed mySize |
	
	mySize := self size.
	reversed := self class new: mySize.
	
	1 to: mySize do: [
		:index |
		reversed at: index put: (self at: mySize - index + 1)
	].
	
	^ reversed