building
imageSpaceForObject: anObject
	anObject == SmalltalkImage
		ifTrue: [
			^ HeaderSize + 2 "system dictionary => key array + value array"
		].
	anObject class class == Metaclass
		ifTrue: [
			^ HeaderSize + anObject allClassVariables size
		].
	anObject class == Metaclass
		ifTrue: [
			^ HeaderSize + ClassInstanceVariableSize
		].
	(#(nil true false) includes: anObject)
		ifTrue: [
			^ HeaderSize
		].
	anObject class == SmallInteger "character's ascii value"
		ifTrue: [
			^ HeaderSize + 1 "character => ascii value"
		].
	anObject isSymbol
		ifTrue: [
			^ HeaderSize + anObject size "symbol => all characters"
		].