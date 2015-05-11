enumerating
do: aBlock separatedBy: separatorBlock
	| isFirst |
	
	isFirst := true.
	
	self do: [
		:each |
		isFirst
			ifTrue: [ isFirst := false ]
			ifFalse: [ separatorBlock value ].
		aBlock value: each
	]