visiting
visitTemporaryVariable: aVariable
	| binding |
	
	binding := compilationContext bindingFor: aVariable literal.
	
	(binding isNil or: [ binding type ~~ #temporaryVariable ])
		ifTrue: [
			ASCompileError signal: 'Undefined temporary variable: ' , aVariable literal
		].
	
	assigningExpression
		ifNotNil: [
			self evaluateAssigningExpression.
			self instruction: #storeTemporaryVariable
				with: binding index
		]
		ifNil: [
			binding index < 5
				ifTrue: [
					self instruction: (#pushTemporaryVariable , (Character value: $0 asciiValue + binding index) asString) asSymbol
				]
				ifFalse: [
					self instruction: #pushTemporaryVariable
						with: binding index
				]
		]