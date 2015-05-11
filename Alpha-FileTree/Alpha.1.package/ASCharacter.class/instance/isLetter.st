testing
isLetter
	^ (LowercaseCharacters includes: self) or:
		[ UppercaseCharacters includes: self ]