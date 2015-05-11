enumerating
reject: aBlock
	| result |
	
	result := self copyEmpty.
	self do: [ :each | (aBlock value: each) ifFalse: [ result add: each ] ].
	^ result