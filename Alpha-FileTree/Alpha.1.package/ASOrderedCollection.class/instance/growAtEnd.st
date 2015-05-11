private
growAtEnd
	| newArray |
	
	newArray := ASArray new: array size * 2.
	
	firstIndex to: lastIndex do: [
		:index |
		newArray at: index put: (array at: index)
	].
	
	array := newArray