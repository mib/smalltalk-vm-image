class membership
isKindOf: aClass
	^ self class == aClass
		ifTrue: [ true ]
		ifFalse: [ self class inheritsFrom: aClass ]