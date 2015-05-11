executing
loadPatternsFromFile: aFilename
	| stream filePatterns |
	
	filePatterns := OrderedCollection new.
	stream := ASFileReadStream on: aFilename.
	
	stream linesDo: [
		:pattern |
		pattern size > 0 ifTrue: [
			filePatterns add: pattern
		]
	].
	
	stream close.
	
	^ filePatterns