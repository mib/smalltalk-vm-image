initialization
initialize
	CharacterTokens := {
		$[ -> #openingSquareBracket.
		$] -> #closingSquareBracket.
		${ -> #openingBracket.
		$} -> #closingBracket.
		$( -> #openingParenthesis.
		$) -> #closingParenthesis.
		$; -> #semicolon.
		$. -> #period.
		$^ -> #circumflex
	} asDictionary.
	
	SpecialConstants := {
		#true -> true.
		#false -> false.
		#nil -> nil
	} asDictionary.
	
	BinaryMessageCharacters := #(
		$+ $- $/ $\ $* $~ $< $> $= $@ $% $| $& $? $,
	).
	
	DecimalNumberCharacters := (
		($0 to: $9)
			withIndexCollect: [ :char :index | char -> index ]
	) asDictionary.
	NumberCharacters := (
		($0 to: $9) , ($a to: $z)
			withIndexCollect: [ :char :index | char -> index ]
	) asDictionary