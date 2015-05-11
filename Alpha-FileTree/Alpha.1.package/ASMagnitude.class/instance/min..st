comparing
min: aMagnitude
	^ self < aMagnitude
		ifTrue: [ self ]
		ifFalse: [ aMagnitude ]