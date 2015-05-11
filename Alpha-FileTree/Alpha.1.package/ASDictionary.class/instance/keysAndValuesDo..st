enumerating
keysAndValuesDo: aBlock
	1 to: keyArray size do: [
		:index |
		(keyArray at: index)
			ifNotNil: [
				aBlock
					value: (keyArray at: index)
					value: (valueArray at: index)
			]
	]