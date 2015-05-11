benchmarks
compilation
Transcript show: (ASCompiler compileSource:
'measureStackSizeFor: instructionCollection from: beginIndex to: endIndex
	| index stackSize maxStackSize instruction jumpSize |
	
	stackSize := 0.
	maxStackSize := 0.
	index := beginIndex.
	
	[ index <= endIndex ]
		whileTrue: [
			instruction := instructionCollection at: index.
			
			stackSize := stackSize + (self stackPositionChangeFor: instruction).
			maxStackSize := maxStackSize max: stackSize.
			
			index := index + 1.
			
			"only follow forward jumps to avoid infinite cycles"
			((instruction type == #jump or: [ instruction type beginsWith: #popJump ])
			and: [ (jumpSize := ((instruction first - 128) * 256) + instruction second) > 0 ])
				ifTrue: [
					"if the jump is conditional, measure both options (following the jump or not)"
					(instruction type beginsWith: #popJump)
						ifTrue: [
							maxStackSize :=
								maxStackSize max:
									(stackSize + (self measureStackSizeFor: instructionCollection from: index to: endIndex)).
						].
					
					[ jumpSize > 0 ] whileTrue: [
						jumpSize := jumpSize - (instructionCollection at: index) bytes.
						index := index + 1
					]
				]
		].
	
	^ maxStackSize'
forClass: ASCompiler); cr.

"------------------------------------------------------"

Transcript show: (ASCompiler compileSource:
'visitMessage: aMessage
	| isSuperSend selectorLiteral |
	
	((#(whileTrue whileFalse) includes: aMessage selector) and: [ aMessage receiver notNil and: [ aMessage receiver isBlock ] ])
		ifTrue: [
			^ self visitWhile: (aMessage selector == #whileTrue) block: aMessage receiver
		].
	((#(whileTrue: whileFalse:) includes: aMessage selector) and: [ aMessage receiver notNil and: [ aMessage receiver isBlock and: [ aMessage arguments first isBlock ] ] ])
		ifTrue: [
			^ self visitWhile: aMessage receiver is: (aMessage selector == #whileTrue:) block: aMessage arguments first
		].
	
	aMessage receiver ifNotNil: [
		aMessage receiver accept: self
	].
	
	((#(ifTrue: ifFalse:) includes: aMessage selector) and: [ aMessage arguments first isBlock ])
		ifTrue: [
			^ self visitIf: aMessage receiver is: (aMessage selector == #ifTrue:) block: aMessage arguments first
		].
	((aMessage selector == #ifTrue:ifFalse:) and: [ aMessage arguments first isBlock and: [ aMessage arguments second isBlock ] ])
		ifTrue: [
			^ self visitIf: aMessage receiver trueBlock: aMessage arguments first falseBlock: aMessage arguments second
		].
	((aMessage selector == #ifFalse:ifTrue:) and: [ aMessage arguments first isBlock and: [ aMessage arguments second isBlock ] ])
		ifTrue: [
			^ self visitIf: aMessage receiver trueBlock: aMessage arguments second falseBlock: aMessage arguments first
		].
	((#(ifNil: ifNotNil:) includes: aMessage selector) and: [ aMessage arguments first isBlock ])
		ifTrue: [
			^ self visitIf: aMessage receiver isNil: (aMessage selector == #ifNil:) block: aMessage arguments first
		].
	((aMessage selector == #ifNil:ifNotNil:) and: [ aMessage arguments first isBlock and: [ aMessage arguments second isBlock ] ])
		ifTrue: [
			^ self visitIf: aMessage receiver nilBlock: aMessage arguments first notNilBlock: aMessage arguments second
		].
	((aMessage selector == #ifNotNil:ifNil:) and: [ aMessage arguments first isBlock and: [ aMessage arguments second isBlock ] ])
		ifTrue: [
			^ self visitIf: aMessage receiver nilBlock: aMessage arguments second notNilBlock: aMessage arguments first
		].
	(aMessage selector == #yourself)
		ifTrue: [
			"#yourself would pop the receiver off the stack and then push it back, so essentially nothing happens"
			^ nil
		].
	
	isSuperSend := instructions last type = #pushSuper.
	
	aMessage arguments do: [
		:each | each accept: self
	].
	
	(aMessage selector == #==)
		ifTrue: [
			^ self instruction: #sendSelectorIdentical
		].
	(aMessage selector == #~~)
		ifTrue: [
			^ self instruction: #sendSelectorNotIdentical
		].
	
	(isSuperSend not and: [ SpecialSelectors includesKey: aMessage selector ])
		ifTrue: [
			^ self instruction:
					(#(#sendSpecialSelectorWith0Arguments #sendSpecialSelectorWith1Argument #sendSpecialSelectorWith2Arguments)
						at: aMessage arguments size + 1)
				with: (SpecialSelectors at: aMessage selector)
		].
	
	selectorLiteral := self literal: aMessage selector.
	
	isSuperSend
		ifTrue: [
			self instruction: #sendSelectorToSuper
				with: selectorLiteral
				with: aMessage arguments size
		]
		ifFalse: [
			self instruction: #sendSelector
				with: selectorLiteral
				with: aMessage arguments size
		]'
forClass: ASCompiler); cr.

"This will take a very long time..."