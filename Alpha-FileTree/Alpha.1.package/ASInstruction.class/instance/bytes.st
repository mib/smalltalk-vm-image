accessing
bytes
	third ifNotNil: [ ^ 4 ].
	second ifNotNil: [ ^ 3 ].
	first ifNotNil: [ ^ 2 ].
	^ 1