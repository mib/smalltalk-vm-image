private
grow
	| newCollection |
	
	newCollection := collection class new: (10 max: collection size * 2).
	
	1 to: endPosition do: [
		:index |
		newCollection at: index put: (collection at: index)
	].
	
	collection := newCollection