visiting blocks
visitBlockReturnOf: aBlock
	aBlock methodRoot
		ifTrue: [
			instructions ifNotEmpty: [ self instruction: #pop ].
			self instruction: #returnSelfFromMethod
		]
		ifFalse: [ self instruction: #returnTopFromBlock ]