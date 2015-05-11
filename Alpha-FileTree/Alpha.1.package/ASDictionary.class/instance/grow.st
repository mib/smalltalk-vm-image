private
grow
	| newKeyArray newValueArray |
	
	newKeyArray := ASArray new: keyArray size * 2.
	newValueArray := ASArray new: keyArray size * 2.
	
	1 to: keyArray size do: [
		:index |
		newKeyArray at: index put: (keyArray at: index).
		newValueArray at: index put: (valueArray at: index).
	].
	
	keyArray := newKeyArray.
	valueArray := newValueArray