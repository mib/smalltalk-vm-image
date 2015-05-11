compiling
convertToBytecodes
	bytecodes := OrderedCollection new.
	
	instructions do: [
		:instruction |
		bytecodes add: (Bytecodes at: instruction type).
		
		instruction first ifNotNil: [
			bytecodes add: instruction first.
		].
		instruction second ifNotNil: [
			bytecodes add: instruction second.
		].
		instruction third ifNotNil: [
			bytecodes add: instruction third.
		]
	]