visiting
visitClassVariable: aVariable
	| binding |
	
	binding := compilationContext bindingFor: aVariable literal.
	
	(binding isNil or: [ binding type ~~ #classVariable ])
		ifTrue: [
			ASCompileError signal: 'Undefined class variable: ' , aVariable literal
		].
	
	assigningExpression
		ifNotNil: [
			self evaluateAssigningExpression.
			self instruction: #storeClassVariable
				with: binding index
		]
		ifNil: [
			self instruction: #pushClassVariable
				with: binding index
		]