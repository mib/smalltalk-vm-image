enumerating
withIndexDo: twoParameterBlock
	1 to: self size do: [
		:index |
		twoParameterBlock
			value: (self at: index)
			value: index
	]