initialization
initialize
	AsciiCharacters ifNil: [
		AsciiCharacters := Array new: 256.
		0 to: 255 do: [
			:value |
			AsciiCharacters at: value + 1 put: (self basicNew setValue: value)
		]
	].
	
	DigitCharacters := Array new: 10.
	1 to: 10 do: [
		:index |
		DigitCharacters at: index put: (AsciiCharacters at: 48 + index)
	].
	
	UppercaseCharacters := Array new: 26.
	1 to: 26 do: [
		:index |
		UppercaseCharacters at: index put: (AsciiCharacters at: 65 + index)
	].
	
	LowercaseCharacters := Array new: 26.
	1 to: 26 do: [
		:index |
		LowercaseCharacters at: index put: (AsciiCharacters at: 97 + index)
	].