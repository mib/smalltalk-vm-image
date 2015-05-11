helpers
convertToBytes: anInteger
	^ {
		(anInteger bitShift: -24) bitAnd: 16rFF.
		(anInteger bitShift: -16) bitAnd: 16rFF.
		(anInteger bitShift: -8) bitAnd: 16rFF.
		anInteger bitAnd: 16rFF
	}