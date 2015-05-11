testing
inheritsFrom: aClass
	self == aClass
		ifTrue: [ ^ true ]
		ifFalse: [
			self superclass
				ifNotNil: [
					^ self superclass inheritsFrom: aClass
				]
				ifNil: [ ^ false ]
		]