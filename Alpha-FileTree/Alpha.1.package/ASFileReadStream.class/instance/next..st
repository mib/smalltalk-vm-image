accessing
next: aNumber
	| string |
	
	string := ASString new: aNumber.
	
	1 to: aNumber do: [
		:index |
		string at: index put: self next
	].
	
	^ string