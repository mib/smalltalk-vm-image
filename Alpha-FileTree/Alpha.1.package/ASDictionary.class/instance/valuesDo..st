enumerating
valuesDo: aBlock
	1 to: keyArray size do: [
		:index |
		(keyArray at: index)
			ifNotNil: [
				aBlock value: (valueArray at: index)
			]
	]