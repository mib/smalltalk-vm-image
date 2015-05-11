processing
processCharacters
	0 to: 255 do: [
		:value |
		| char |
		char := ASCharacter value: value.
		self storeOp: (self createCharacterWith: value) for: char
	]