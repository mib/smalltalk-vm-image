command line
parseCommandLineArguments
	| index argument argumentCount expectedArgument optionsAllowed |
	
	expectedArgument := #pattern.
	optionsAllowed := true.
	
	argumentCount := ASScriptRunner argumentCount.
	index := 1.
	
	[ index <= argumentCount ]
		whileTrue: [
			argument := ASScriptRunner argumentAt: index.
			
			(optionsAllowed and: [ argument = '--' ])
				ifTrue: [
					optionsAllowed := false.
				]
				ifFalse: [
					(optionsAllowed and: [ argument size >= 2 and: [ argument first == $- ] ])
						ifTrue: [
							argument = '-h'
								ifTrue: [ displayHelp := true ].
							argument = '-i'
								ifTrue: [ caseSensitive := false ].
							argument = '-v'
								ifTrue: [ invertMatch := true ].
							argument = '-c'
								ifTrue: [ printCount := true ].
							argument = '-x'
								ifTrue: [ matchWholeLine := true ].
							argument = '-e'
								ifTrue: [
									index := index + 1.
									index <= argumentCount
										ifTrue: [
											patterns add: (ASScriptRunner argumentAt: index).
											expectedArgument == #pattern
												ifTrue: [ expectedArgument := #inputFilename ]
										]
										ifFalse: [ Transcript show: 'Missing value for argument: ' , argument; cr ]
								].
							argument = '-f'
								ifTrue: [
									index := index + 1.
									index <= argumentCount
										ifTrue: [
											patterns addAll: (self loadPatternsFromFile: (ASScriptRunner argumentAt: index)).
											expectedArgument == #pattern
												ifTrue: [ expectedArgument := #inputFilename ]
										]
										ifFalse: [ Transcript show: 'Missing value for argument: ' , argument; cr ]
								].
							
							(#('-h' '-i' '-v' '-c' '-x' '-e' '-f') includes: argument) not
								ifTrue: [ Transcript show: 'Unknown argument: ' , argument; cr ]
						]
						ifFalse: [
							expectedArgument isNil
								ifTrue: [ Transcript show: 'Unexpected argument: ' , argument; cr ].
							expectedArgument == #outputFilename
								ifTrue: [
									outputFilename := argument.
									expectedArgument := nil
								].
							expectedArgument == #inputFilename
								ifTrue: [
									inputFilename := argument.
									expectedArgument := #outputFilename
								].
							expectedArgument == #pattern
								ifTrue: [
									patterns add: argument.
									expectedArgument := #inputFilename
								].
						]
				].
			
			index := index + 1
		].
	
	expectedArgument == #pattern ifTrue: [
		displayHelp := true
	]