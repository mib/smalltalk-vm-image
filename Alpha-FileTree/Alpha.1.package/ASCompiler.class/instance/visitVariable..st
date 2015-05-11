visiting
visitVariable: aVariable
	| binding |
	
	(#(#self #super #nil #true #false #thisContext) includes: aVariable literal)
		ifTrue: [ ^ self visitSpecialVariable: aVariable ].
	
	binding := compilationContext bindingFor: aVariable literal.
	
	binding ifNil: [
		aVariable literal first isUppercase
			ifTrue: [
				^ self visitGlobalVariable: aVariable
			]
			ifFalse: [
				^ ASCompileError signal: 'Undefined variable: ' , aVariable literal
			]
	].
	
	binding type == #instanceVariable
		ifTrue: [ ^ self visitInstanceVariable: aVariable ].
	binding type == #classVariable
		ifTrue: [ ^ self visitClassVariable: aVariable ].
	binding type == #temporaryVariable
		ifTrue: [ ^ self visitTemporaryVariable: aVariable ].
	
	^ ASCompileError signal: 'Undefined variable: ' , aVariable literal