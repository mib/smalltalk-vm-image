matching
is: pattern substringOf: line characterMatcher: characterMatcherBlock
	| patternLength lineLength i j |
	
	patternLength := pattern size.
	lineLength := line size.
	
	(lineLength < patternLength or: [ patternLength = 0 ])
		ifTrue: [ ^ false ].
	
	i := patternLength.
	
	[ i <= lineLength ]
		whileTrue: [
			j := patternLength.
			[ characterMatcherBlock value: (pattern at: j) value: (line at: i) ]
				whileTrue: [
					j = 1 ifTrue: [ ^ true ].
					j := j - 1.
					i := i - 1
				].
			i := i + patternLength - j + 1
		].
	
	^ false