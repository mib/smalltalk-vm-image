visiting
visitSpecialVariable: aVariable
	assigningExpression ifNotNil: [
		^ ASCompileError signal: 'Cannot assign to ' , aVariable literal
	].
	
	aVariable literal == #self
		ifTrue: [ self instruction: #pushSelf ].
	aVariable literal == #super
		ifTrue: [ self instruction: #pushSuper ]. "a fake instruction for generating super-sends, will be changed to pushSelf later"
	aVariable literal == #nil
		ifTrue: [ self instruction: #pushNil ].
	aVariable literal == #true
		ifTrue: [ self instruction: #pushTrue ].
	aVariable literal == #false
		ifTrue: [ self instruction: #pushFalse ].
	aVariable literal == #thisContext
		ifTrue: [ self instruction: #pushThisContext ]