instance creation
fromString: aString
	^ (self lookup: aString)
		ifNil: [
			AllSymbols add:
				((self basicNew: aString size)
					setString: aString)
		]