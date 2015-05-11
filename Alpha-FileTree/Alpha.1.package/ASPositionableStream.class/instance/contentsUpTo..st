accessing
contentsUpTo: upToPosition
	| newCollection |
	
	newCollection := collection class new: upToPosition.
	
	1 to: upToPosition do: [
		:index |
		newCollection at: index put: (collection at: index)
	].
	
	^ newCollection