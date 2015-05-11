visiting blocks
visitBlockStatementsOf: aBlock
	aBlock statements isEmpty
		ifTrue: [
			aBlock methodRoot ifFalse: [ self instruction: #pushNil ]
		]
		ifFalse: [
			aBlock statements
				do: [ :statement | statement accept: self ]
				separatedBy: [ self cleanUpAfterStatement ].
		].