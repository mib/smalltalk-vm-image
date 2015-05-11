enumerating
associationsDo: aBlock
	1 to: keyArray size do: [
		:index |
		(keyArray at: index)
			ifNotNil: [
				aBlock value: (
					ASAssociation
						key: (keyArray at: index)
						value: (valueArray at: index)
				)
			]
	]