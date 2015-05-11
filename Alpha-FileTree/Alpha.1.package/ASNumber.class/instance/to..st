ranges
to: endNumber
	| collection |
	
	collection := Array new: endNumber - self + 1.
	
	1 to: endNumber do: [
		:index |
		collection at: index put: index
	].
	
	^ collection