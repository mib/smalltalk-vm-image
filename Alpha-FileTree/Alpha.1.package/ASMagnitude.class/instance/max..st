comparing
max: aMagnitude
	^ self > aMagnitude
		ifTrue: [ self ]
		ifFalse: [ aMagnitude ]