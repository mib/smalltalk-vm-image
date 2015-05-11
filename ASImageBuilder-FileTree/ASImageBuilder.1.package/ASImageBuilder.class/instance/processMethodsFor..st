processing
processMethodsFor: aClass
	| selectors methodDictionary |
	
	methodDictionary := Dictionary new.
	selectors := aClass methodDictionary keys sorted.
	
	aClass == ASObject ifTrue: [
		selectors := selectors reject: [ :each | #(#at: #at:put: #size #byteAt: #byteAt:put: #byteSize) includes: each ]
	].
	
	selectors do: [
		:selector |
		| selectorOp method compiledMethodOp |
		method := aClass methodNamed: selector.
		selectorOp := self processObject: selector.
		
		compiledMethodOp := self processObject: (
			(ASCompiler compile: (
					(ASParser on: method ast source readStream)
						parseMethod
				) forClass: aClass
			) selector: selector
		).
		
		methodDictionary at: selectorOp put: compiledMethodOp
	].
	
	^ self createDictionaryWith: methodDictionary