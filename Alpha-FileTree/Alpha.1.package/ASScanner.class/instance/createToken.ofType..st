tokenizing
createToken: contentString ofType: typeSymbol
	^ ASToken new
		content: contentString;
		type: typeSymbol