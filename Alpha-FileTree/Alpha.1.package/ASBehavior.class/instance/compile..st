method dictionary
compile: sourceString
	| compiledMethod |
	
	compiledMethod :=
		ASCompiler
			compileSource: sourceString
			forClass: self.
	
	^ self
		addSelector: compiledMethod selector
		withMethod: compiledMethod