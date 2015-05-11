scanning
nextBlockParameter
	| identifier |
	
	identifier := self nextIdentifier.
	
	identifier content last == $:
		ifTrue: [
			ASTokenizingError signal: 'Unexpected colon encountered while parsing a block parameter. A block parameter name cannot contain a colon.'
		].
	
	^ identifier type: #blockParameter