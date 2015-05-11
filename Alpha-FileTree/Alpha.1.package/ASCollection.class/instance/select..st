enumerating
select: aBlock
	| result |
	
	result := self copyEmpty.
	self do: [ :each | (aBlock value: each) ifTrue: [ result add: each ] ].
	^ result