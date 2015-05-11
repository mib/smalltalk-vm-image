enumerating
do: aBlock
	1 to: endPosition do: [
		:index |
		aBlock value: (collection at: index)
	]