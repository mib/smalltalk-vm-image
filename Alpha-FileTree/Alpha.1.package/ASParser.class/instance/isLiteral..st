parsing
isLiteral: aToken
	^ #(#character #string #symbol #number) includes: aToken type