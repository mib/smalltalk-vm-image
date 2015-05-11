private
setValue: anInteger
	value ifNotNil: [
		self error: 'A character is immutable, cannot change its value.'
	].
	
	value := anInteger