executing
execute
	displayHelp
		ifTrue: [ ^ self displayHelp ].
	
	[
		inputStream := ASFileReadStream on: inputFilename.
	] on: Error do: [ Transcript show: 'Error opening input file: ' , inputFilename; cr. ^ nil ].
	
	[
		outputStream := ASFileWriteStream on: outputFilename.
	] on: Error do: [ Transcript show: 'Error opening output file: ' , outputFilename; cr. inputStream close. ^ nil ].
	
	printCount
		ifTrue: [
			"do not output anything, just print the number of lines matched"
			| count |
			count := 0.
			self matchedLinesDo: [ :each | count := count + 1 ].
			outputStream nextPutAll: count printString; lf
		]
		ifFalse: [
			"print the matched lines"
			self matchedLinesDo: [ :each | outputStream nextPutAll: each ]
		].
	
	inputStream close.
	outputStream close