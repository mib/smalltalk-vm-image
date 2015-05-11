visiting
visitInstanceVariable: aVariable
	| binding |
	
	binding := compilationContext bindingFor: aVariable literal.
	
	(binding isNil or: [ binding type ~~ #instanceVariable ])
		ifTrue: [
			ASCompileError signal: 'Undefined instance variable: ' , aVariable literal
		].
	
	assigningExpression
		ifNotNil: [
			self evaluateAssigningExpression.
			self instruction: #storeInstanceVariable
				with: binding index
		]
		ifNil: [
			binding index < 5
				ifTrue: [
					self instruction: (#pushInstanceVariable , (Character value: $0 asciiValue + binding index) asString) asSymbol
				]
				ifFalse: [
					self instruction: #pushInstanceVariable
						with: binding index
				]
		]