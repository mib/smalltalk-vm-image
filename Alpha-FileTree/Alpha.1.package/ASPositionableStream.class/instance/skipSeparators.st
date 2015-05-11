accessing
skipSeparators
	[ self atEnd ]
		whileFalse: [
			self next isSeparator ifFalse: [
				position := position - 1
			]
		]