private
growAtBeginning
	| newArray oldSize |
	
	oldSize := array size.
	newArray := ASArray new: oldSize * 2.
	
	firstIndex to: lastIndex do: [
		:index |
		newArray at: index + oldSize put: (array at: index)
	].
	
	firstIndex := firstIndex + oldSize.
	lastIndex := lastIndex + oldSize.
	
	array := newArray