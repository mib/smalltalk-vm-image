accessing
linesDo: aBlock
	| buffer bufferPosition character line cr lf nextCharacter |
	
	cr := ASCharacter cr.
	lf := ASCharacter lf.
	
	bufferPosition := 1001.
	
	nextCharacter := [
		bufferPosition := bufferPosition + 1.
		
		bufferPosition > 1000 ifTrue: [
			buffer := self next: 1000.
			bufferPosition := 1
		].
		
		buffer at: bufferPosition
	].
	
	line := ASWriteStream on: (ASString new: 100).
	
	[ character := nextCharacter value. character notNil ]
		whileTrue: [
			(character == lf or: [ character == cr ])
				ifTrue: [
					character == cr ifTrue: [
						"might be CRLF"
						character := nextCharacter value.
						character == lf
							ifFalse: [ bufferPosition := bufferPosition - 1 ]
					].
					
					aBlock value: line contents.
					line := ASWriteStream on: (ASString new: 100)
				]
				ifFalse: [
					line nextPut: character
				]
		]