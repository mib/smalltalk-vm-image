enumerating
like: anObject
	self do: [
		:each |
		each = anObject
			ifTrue: [ ^ each ]
	].
	
	^ nil