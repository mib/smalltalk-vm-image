executing
matchedLinesDo: aBlock
	| characterMatcherBlock patternMatcherBlock matcherBlock |
	
	"case-sensitiveness only affects ASCII letters A-Z (65 through 90) and a-z (97 through 122)"
	caseSensitive
		ifTrue: [
			characterMatcherBlock := [ :pattern :character | pattern == character ]
		]
		ifFalse: [
			patterns := patterns collect: [ :each | each asLowercase ].
			characterMatcherBlock := [ :pattern :character | pattern == character asLowercase ]
		].
	
	"if this option is used, a line is matched only if it is equal to the pattern (same length, no other characters); otherwise it is sufficient for the pattern to be a substring of the line"
	matchWholeLine
		ifTrue: [
			patternMatcherBlock := [
				:pattern :line |
				"line includes the ending CR or LF or CR+LF"
				(pattern size == (line size - 1)
					or: [ pattern size == (line size - 2) and: [ line nextToLast == ASCharacter cr ] ]
				)
					and: [
						(1 to: pattern size) allSatisfy: [
							:index |
							characterMatcherBlock
								value: (pattern at: index)
								value: (line at: index)
						]
					]
			]
		]
		ifFalse: [
			patternMatcherBlock := [
				:pattern :line |
				self is: pattern substringOf: line characterMatcher: characterMatcherBlock
			]
		].
	
	"a line is matched if any of the patterns matches it"
	matcherBlock := [
		:line |
		patterns anySatisfy: [
			:pattern |
			patternMatcherBlock value: pattern value: line
		]
	].
	
	"output lines that are matched by *none* of the patterns"
	invertMatch ifTrue: [
		| originalMatcherBlock |
		originalMatcherBlock := matcherBlock.
		matcherBlock := [ :line | (originalMatcherBlock value: line) not ]
	].
	
	"for every line of the input stream, evaluate aBlock with it if it matches"
	inputStream linesWithSeparatorsDo: [
		:line |
		(matcherBlock value: line)
			ifTrue: [ aBlock value: line ]
	]