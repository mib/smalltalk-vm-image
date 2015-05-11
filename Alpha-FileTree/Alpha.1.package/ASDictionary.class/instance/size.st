accessing
size
	| count |
	
	count := 0.
	self keysDo: [ :each | count := count + 1 ].
	^ count