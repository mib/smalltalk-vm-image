visiting
visitMessage: aMessage
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
	"(aMessage selector == #isNil)
		ifTrue: [
			^ self instruction: #sendSelectorIsNil
		].
	(aMessage selector == #notNil)
		ifTrue: [
			^ self instruction: #sendSelectorNotNil
		]."
	
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
		]