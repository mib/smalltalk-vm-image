method dictionary
lookupSelector: aSelector
	| currentClass |
	
	currentClass := self.
	
	[ currentClass notNil ]
		whileTrue: [
			(currentClass includesSelector: aSelector)
				ifTrue: [ ^ currentClass methodNamed: aSelector ].
			currentClass := currentClass superclass
		].
	
	^ nil