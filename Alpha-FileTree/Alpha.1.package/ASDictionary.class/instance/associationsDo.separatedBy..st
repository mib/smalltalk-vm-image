enumerating
associationsDo: aBlock separatedBy: separatorBlock
	| isFirst |
	
	isFirst := true.
	
	1 to: keyArray size do: [
		:index |
		(keyArray at: index)
			ifNotNil: [
				isFirst
					ifTrue: [ isFirst := false ]
					ifFalse: [ separatorBlock value ].
				aBlock value: (
					ASAssociation
						key: (keyArray at: index)
						value: (valueArray at: index)
				)
			]
	]