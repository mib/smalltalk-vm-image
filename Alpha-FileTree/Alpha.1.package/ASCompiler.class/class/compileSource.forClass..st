compiling
compileSource: aString forClass: aClass
	| ast |
	
	ast :=
		(ASParser on: aString readStream)
			parseMethod.
	
	^ (self compile: ast forClass: aClass)
		selector: ast selector