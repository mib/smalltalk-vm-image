accessing
contents
	^ ASString streamContents: [
			:stream |
			self do: [ :character | stream nextPut: character ]
		]