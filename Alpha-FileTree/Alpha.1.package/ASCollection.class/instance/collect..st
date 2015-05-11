enumerating
collect: aBlock
	| result |
	
	result := self copyEmpty.
	self do: [ :each | result add: (aBlock value: each) ].
	^ result